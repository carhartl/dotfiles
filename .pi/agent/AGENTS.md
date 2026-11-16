# Development environment

- Use mise-managed tools. Run `mise config ls` and `mise ls --current` in the working directory to identify applicable configuration and tool versions, including environment overrides.
- Prefer existing mise tasks; otherwise use `mise exec -- <command>` to run configured tools.
- Do not install or upgrade tools globally without asking.

# Git worktrees

- Ask before creating a worktree.
- Create worktrees in the main checkout's .worktrees directory, not inside another worktree; Git is configured to ignore this directory.
- Never remove a worktree with uncommitted changes.
- Use .worktrees/<branch-name> as the worktree path, preserving slashes. If no branch name was specified, ask.
