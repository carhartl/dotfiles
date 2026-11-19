"""Exercise the documented Bash commands without contacting model providers.

Run: mise exec -- python -m unittest discover -s tests -v
"""

import json
import os
from pathlib import Path
import re
import shlex
import shutil
import subprocess
import sys
import tempfile
import unittest


SKILL = Path(__file__).resolve().parents[1] / "SKILL.md"
MODELS = {"claude-opus-5.5", "gpt-6.2-sol", "gemini-4-argon"}


class LaunchTests(unittest.TestCase):
    def run_reviewers(self, fail_model=""):
        text = SKILL.read_text()
        blocks = re.findall(r"```bash\n(.*?)```", text, re.S)
        setup = blocks[0] if len(blocks) > 1 else ""
        launch = blocks[-1]
        with tempfile.TemporaryDirectory(prefix="ensemble test ") as directory:
            root = Path(directory)
            target = root / "target with spaces.md"
            target.write_text("Review fixture.\n")
            (root / "mktemp").symlink_to(shutil.which("mktemp"))
            mock = root / "pi"
            mock.write_text(
                f"#!{sys.executable}\n"
                "import json, os, pathlib, sys, time\n"
                "args = sys.argv[1:]\n"
                "model = args[args.index('--model') + 1].split('/')[-1]\n"
                "time.sleep(0.1 if model.startswith('gemini') else 0)\n"
                "pathlib.Path(os.environ['MOCK_LOG'], model + '.json').write_text(json.dumps(args))\n"
                "print('## Findings\\nNone.\\n## What works well\\nFixture.')\n"
                "if model == os.environ.get('FAIL_MODEL'):\n"
                "    print('mock provider failure', file=sys.stderr)\n"
                "    sys.exit(7)\n"
            )
            mock.chmod(0o700)
            launch = launch.replace('P="<resolved path>"', "P=" + shlex.quote(str(target)))
            script = setup + '\nprintf "%s" "Review contract" > "$S/ensemble-prompt.txt"\n' + launch
            # No real Pi or other executables are reachable through this PATH.
            env = dict(os.environ, PATH=str(root), BASH_ENV="/dev/null",
                       TMPDIR=str(root), S=str(root), MOCK_LOG=str(root), FAIL_MODEL=fail_model)
            result = subprocess.run(["/bin/bash", "-c", script], env=env, text=True,
                                    capture_output=True, timeout=10)
            calls = [json.loads(p.read_text()) for p in root.glob("*.json")]
            self.assertEqual(len(calls), 3, result.stderr)
            self.assertEqual({c[c.index("--model") + 1] for c in calls},
                             {"github-copilot/" + m for m in MODELS})
            for call in calls:
                for flag in ("-nt", "--no-session", "--no-extensions", "--no-skills",
                             "--no-context-files", "--no-approve", "--system-prompt",
                             "--append-system-prompt"):
                    self.assertIn(flag, call)
                self.assertEqual(call[-2:], ["@" + str(target), "Review contract"])
            self.assertEqual(len(list(root.glob("ensemble-review.*"))), 1,
                             "Use a fresh system temporary directory, not the memory scratchpad")
            return result

    def test_all_reviewers_succeed(self):
        result = self.run_reviewers()
        self.assertEqual(result.returncode, 0, result.stderr)

    def test_failed_reviewer_blocks_completion_even_with_valid_headings(self):
        result = self.run_reviewers("gpt-6.2-sol")
        self.assertNotEqual(result.returncode, 0)
        self.assertIn("gpt", result.stderr)
        self.assertIn("7", result.stderr)

    def test_local_references_exist(self):
        for link in re.findall(r"\]\(([^)]+)\)", SKILL.read_text()):
            with self.subTest(link=link):
                self.assertTrue((SKILL.parent / link).is_file(), link)


if __name__ == "__main__":
    unittest.main()
