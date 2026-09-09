# Repo rules

Copy this into a new project as `CLAUDE.md`, then customize the **Testing & linting** section for
that project's actual stack — everything else is generic and can be used as-is.

## Documentation structure — mandatory

All non-code docs live under `docs/`. Never create a `.md` file at repo root (except root
`README.md`). Full structure and rationale: `docs/README.md`.

```
docs/
├── research/          Raw findings, one file per session — dated, never edited after
│   ├── sources.md       Exception: reusable source-channel log, updated in place
│   └── YYYY-MM-DD-topic.md
├── synthesis/          Current best understanding — edited in place as new research lands
├── methodology/        Stable reference frameworks — rarely changes
├── plans/              Decisions + roadmap, applied to this project — status-tracked
└── legal/              Legal/ToS risk assessment, if relevant
```

**Core rule: raw research is dated and immutable; synthesis is living and edited in place.**
A finding is written once, in one research file. The current interpretation of it lives in
synthesis/plans and changes as understanding changes.

Routing, before writing anything:

- New research/investigation session (web research, user interviews, competitor digs, source
  discovery) → new file `docs/research/YYYY-MM-DD-topic.md`. Never edit an existing dated file
  afterward — a correction is a new dated file, not a rewrite.
  - Exception: `docs/research/sources.md` — a running log of source channels, updated in place.
- New understanding derived from research → update the matching file in `docs/synthesis/`
  (create one if the topic is new). Synthesis cites which dated research file(s) it's built from;
  it does not duplicate raw findings.
- A decision or roadmap change → update `docs/plans/gtm-plan.md`, or a new file in `docs/plans/`
  if it's a genuinely separate plan.
- A reusable framework/methodology → add to the matching topic file under `docs/methodology/`
  (linked from `docs/methodology/frameworks.md`'s index) rather than re-deriving it inline in a
  synthesis or plan file. Split into a new topic file if one grows unwieldy.
- Legal/ToS risk findings → `docs/legal/`.

Cross-reference docs with relative links (`../synthesis/...`), so they stay navigable regardless of
entry point.

Before writing any new doc file, check whether an existing synthesis/plan/methodology file already
owns the topic and should be updated instead of forking a new one.

**Before any research/synthesis work** (new research session, updating a synthesis file, writing a
plan): check `docs/methodology/` (start from `frameworks.md`'s index) for an applicable framework
and apply it to how the work is done, not just what gets written down. Skip this check only when
the task itself is adding to or updating methodology.

## If this project has an external audience (public package, Apify Actor, public API, ...)

Some platforms (Apify is one) render this repo's root `README.md` directly as the public-facing
page — meaning engineering internals (architecture diagrams, caching design, scraping-bypass
methods, project structure trees) end up shown to buyers/users who don't need them. If that's the
case here: keep root `README.md` short and audience-facing (what it does, use cases, FAQ — check
what the platform natively provides before duplicating it, e.g. Apify auto-generates Input/Pricing
tabs from real config), and move the engineering depth to `docs/development.md` instead.

## Testing & linting

**Customize this section for the actual stack** — the example below (Node/TypeScript) is
illustrative, not prescriptive. Keep the underlying pattern regardless of stack: a pre-commit hook
is the enforced source of truth, checked before assuming a rule exists or doesn't; new pure
functions get unit tests; the hook is never bypassed to get past a real failure (fix the root cause
— if the hook itself is wrong, fix the hook, don't skip it).

Example (Node/TypeScript project): pre-commit hook runs, in order: `tsc --noEmit` → test runner →
linter. New pure functions (parsing/transform logic with no network/IO) get unit tests in a
co-located `*.test.ts` — not blanket coverage; code that's inherently slow/flaky to test
(crawlers, network calls) isn't unit-tested by default.
