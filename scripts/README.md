# Scripts

Standalone scripts, run manually from the repo root. Not auto-loaded by anything — unlike
`CLAUDE.md`, nothing runs these except a human (or an agent explicitly told to).

## `setup-hooks.sh`

Wires `.githooks/pre-commit` (the docs-structure enforcement hook) into git.

```bash
bash scripts/setup-hooks.sh
```

Run once, after cloning this repo or after copying `.githooks/` + `scripts/setup-hooks.sh` into a
new project. It just runs `git config core.hooksPath .githooks` — safe to re-run any time.

If the target project already has its own pre-commit hook (e.g. wired via npm's `prepare` script),
don't run this as-is — it would overwrite `core.hooksPath` and disable the project's existing hook.
Merge the docs-structure checks from `.githooks/pre-commit` into the existing hook script instead.
