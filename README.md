# project-seed-kit

Reusable docs structure and methodology library — seed new projects with it instead of
reinventing conventions each time. Extracted from a real project that used this structure
end-to-end, not designed up front.

## What's in here

- **`docs/`** — the research/synthesis/plans/methodology structure and the rule behind it (dated,
  immutable raw research vs. living synthesis). See `docs/README.md` for the full explanation.
- **`docs/methodology/`** — the actual reusable asset: named, sourced frameworks for product
  discovery, market mapping/sizing, pricing, and demand validation. Generic, usable as-is in any
  new project.
- **`CLAUDE.template.md`** — the actual rules file: doc routing, skill usage, and (if relevant)
  the public-README-vs-internal-docs split, all in one place an agent actually loads automatically.
  Deliberately not spread across passive per-folder README/template files — those don't get read
  unless something already told the agent to look there, so the real rules live in the one file
  that does get loaded every session. One section (testing/linting) needs customizing per project's
  actual stack; everything else is generic.
- **`skills/`** — a place for Claude Code skills that prove reusable across more than one project.
  Empty until something earns its place here; the rules for writing/promoting one live in
  `CLAUDE.template.md`, not a README here.
- **`.githooks/pre-commit` + `setup-hooks.sh`** — actual technical enforcement of the structure
  rules, not just an instruction an agent could ignore: blocks a stray `.md` at repo root, a
  wrongly-named `docs/research/` file, or an edit to an already-committed dated research file.
  Stack-agnostic (plain bash + git), works the same regardless of the project's language.

## Using this for a new project

1. Copy `docs/` into the new project's repo root.
2. Copy `CLAUDE.template.md` in as `CLAUDE.md`, fill in the Testing & linting section for that
   project's real stack.
3. Copy `.githooks/` and `setup-hooks.sh` in, then run `bash setup-hooks.sh` once to wire the hook
   (`git config core.hooksPath .githooks`). If the project already has its own pre-commit hook
   (e.g. via npm's `prepare` script), merge the docs-structure checks into that hook instead of
   running two separate hook mechanisms.
4. Keep `docs/methodology/` as-is unless a framework genuinely doesn't apply; add new ones back
   here once they've proven reusable, not just once they're written.

## Keeping this in sync

This is a copy-paste seed, not a submodule — improvements made in a downstream project don't
automatically flow back here. When something genuinely generic gets refined in a real project
(a clearer framework writeup, a better doc-routing rule), backport it here manually so the next
project benefits too.
