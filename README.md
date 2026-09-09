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
- **`CLAUDE.template.md`** — the doc-routing rules as a copy-pasteable `CLAUDE.md` starting point.
  One section (testing/linting) needs customizing per project's actual stack; everything else is
  generic.
- **`skills/`** — a place for Claude Code skills that prove reusable across more than one project.
  Empty until something earns its place here.

## Using this for a new project

1. Copy `docs/` into the new project's repo root.
2. Copy `CLAUDE.template.md` in as `CLAUDE.md`, fill in the Testing & linting section for that
   project's real stack.
3. Delete the `TEMPLATE.md` placeholders in `docs/research/`, `docs/synthesis/`, `docs/legal/` once
   real content starts landing there — they're just there so the folders aren't empty in git.
4. Keep `docs/methodology/` as-is unless a framework genuinely doesn't apply; add new ones back
   here once they've proven reusable, not just once they're written.

## Keeping this in sync

This is a copy-paste seed, not a submodule — improvements made in a downstream project don't
automatically flow back here. When something genuinely generic gets refined in a real project
(a clearer framework writeup, a better doc-routing rule), backport it here manually so the next
project benefits too.
