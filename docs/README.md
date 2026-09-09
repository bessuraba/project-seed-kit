# Documentation

Non-code project documentation: research, methodology, synthesis, plans, and legal.

## Structure and the rule behind it

**Raw research is dated and immutable. Synthesis is living and gets edited in place.** A given
finding lives in exactly one research file, written once; the current interpretation of it lives in
a synthesis or plan file that changes as understanding changes. This keeps history intact (you can
always see what was known on a given date) without living docs turning into an unreadable diff mess.

```
docs/
├── research/          Raw findings, one file per session — dated, never edited after
│   ├── sources.md       Exception: reusable source-channel log, updated in place
│   └── YYYY-MM-DD-topic.md
├── synthesis/          Current best understanding — edited in place as new research lands
├── methodology/        Stable reference frameworks — rarely changes, split by topic
│   └── frameworks.md      Index — links to the topic files
├── plans/              Decisions + roadmap, applied to this project — status-tracked
└── legal/               Legal/ToS risk assessment, if relevant to this project
```

## Conventions

- **New research session** → new file in `research/`, named `YYYY-MM-DD-topic.md`. Never edit an
  existing dated file after the fact — a correction is a new dated file, not a rewrite. The one
  exception is `research/sources.md`, a running log meant to be updated in place.
- **New understanding from that research** → update the relevant file in `synthesis/` (or create
  one if it's a new topic). Synthesis files should cite which dated research file(s) they're built
  from, not duplicate the raw findings.
- **A decision or roadmap change** → update `plans/gtm-plan.md` (or a new file in `plans/` if it's
  a genuinely separate plan).
- **A framework/methodology worth reusing** → add it to the matching topic file under
  `methodology/` (create one if it's a new topic, and link it from `methodology/frameworks.md`'s
  index) rather than re-deriving it in a synthesis or plan file. Keep topic files focused — split
  further if one grows unwieldy.
- Cross-reference with relative links (`../synthesis/...`) so the docs stay navigable regardless of
  where they're read from.
- Before any new research/synthesis work, check `methodology/frameworks.md` for an applicable
  framework first — don't re-derive something that's already been worked out.

## Where this came from

Extracted from a project that actually used this structure end-to-end (research → synthesis →
plans, with `methodology/` filling up with real frameworks as they were needed) rather than
designed up front. If a new project's needs don't fit this shape, change it — it's a starting
point, not a mandate.
