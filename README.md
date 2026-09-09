# project-seed-kit

Reusable docs structure and methodology library — seed new projects with it instead of
reinventing conventions each time. Extracted from a real project that used this structure
end-to-end, not designed up front.

## What's in here

- **`docs/`** — the research/synthesis/plans/methodology structure and the rule behind it (dated,
  immutable raw research vs. living synthesis). See `docs/README.md` for the full explanation.
- **`docs/methodology/`** — the actual reusable asset: named, sourced frameworks for product
  discovery, market mapping/sizing, pricing, and demand validation — generic, usable as-is in any
  new project — plus one Apify-specific playbook, kept in because Apify Actors are a recurring
  project type here, not because it's universally generic.
- **`CLAUDE.template.md`** — the actual rules file: doc routing, skill usage, and (if relevant)
  the public-README-vs-internal-docs split, all in one place an agent actually loads automatically.
  Deliberately not spread across passive per-folder README/template files — those don't get read
  unless something already told the agent to look there, so the real rules live in the one file
  that does get loaded every session. One section (testing/linting) needs customizing per project's
  actual stack; everything else is generic.
- **`skills/`** — Claude Code skills that proved reusable across more than one project. Currently
  `apify-cli-debug` (build debugging via the `apify` CLI — the Apify MCP server has no
  build-inspection tools). The rules for writing/promoting one live in `CLAUDE.template.md`, not a
  README here.
- **`.githooks/pre-commit`** — actual technical enforcement of the structure rules, not just an
  instruction an agent could ignore: blocks a stray `.md` at repo root, a wrongly-named
  `docs/research/` file, or an edit to an already-committed dated research file. Stack-agnostic
  (plain bash + git), works the same regardless of the project's language.
- **`scripts/`** — standalone scripts run manually, not auto-loaded by anything. Currently just
  `setup-hooks.sh` (wires the pre-commit hook above); see `scripts/README.md`.
- **`.env.example`** — per-project config template. Scripts/skills that need a project-specific
  value (e.g. an Apify actor slug) read it from `.env` instead of it being hardcoded or left as a
  manual find-and-replace placeholder. `.env` itself is gitignored; only `.env.example` is tracked.

## Using this for a new project

1. Copy `docs/` into the new project's repo root.
2. Copy `CLAUDE.template.md` in as `CLAUDE.md`, fill in the Testing & linting section for that
   project's real stack.
3. Copy `.githooks/` and `scripts/` in, then run `bash scripts/setup-hooks.sh` once to wire the
   hook (`git config core.hooksPath .githooks`). If the project already has its own pre-commit hook
   (e.g. via npm's `prepare` script), merge the docs-structure checks into that hook instead of
   running two separate hook mechanisms — see `scripts/README.md`.
4. Copy `.env.example` and `.gitignore` in (or merge into an existing `.gitignore`), then
   `cp .env.example .env` and fill in real values for whatever skills/scripts need them.
5. Keep `docs/methodology/` as-is unless a framework genuinely doesn't apply; add new ones back
   here once they've proven reusable, not just once they're written.

## Keeping this in sync

This is a copy-paste seed, not a submodule — improvements made in a downstream project don't
automatically flow back here. When something genuinely generic gets refined in a real project
(a clearer framework writeup, a better doc-routing rule), backport it here manually so the next
project benefits too.
