# Development environment

- Use mise-managed tools. Before running project tooling, run `mise config ls` and `mise ls --current` in the working directory to identify applicable configuration and tool versions, including environment overrides.
- Prefer existing mise tasks. Use `mise exec -- <command>` for tools managed by the applicable mise configuration. Run other installed tools directly.
- Installing tool versions already specified by the applicable mise configuration is allowed without asking. Ask before changing configured tool versions or installing or upgrading other global tools.

# Git worktrees

- Ask before creating a worktree unless I already explicitly requested it. If no branch name was specified, ask for it in the same question.
- Create worktrees in the main checkout's `.worktrees` directory, never inside another worktree. Verify that `.worktrees/` is ignored before creating a worktree; if not, ask rather than changing ignore rules.
- Never remove a worktree with uncommitted changes or untracked files. Before removing a clean worktree, check for valuable ignored files and ensure any detached-HEAD commits worth keeping are reachable from a branch or tag.
- Use `.worktrees/<branch-name>` as the worktree path, preserving slashes.

# Writing code

- Never add comments that restate what the code does. Comment only to explain why the code is written that way, or to give context the code cannot show. Documentation comments on public APIs are fine where the project expects them.
- Never add comments that describe the change, the task or the conversation. That belongs in the commit message.
- Do not remove or rewrite existing comments unless your change makes them wrong.
- On an interface, trait, abstract type or header, document only the contract that every implementation must honour. Put details and assumptions specific to one implementation on that implementation.
- Do not extract a helper method that is called only once; inline it.
