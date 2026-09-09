# Skills

Reusable Claude Code skills (`.claude/skills/<name>/SKILL.md` in a real project) that turn out to
be generically useful across projects, not tied to one project's specific tools/stack.

Empty for now — nothing here yet has proven reusable across more than one project. A skill earns a
place here once it's actually been reused, not on first write; a skill written for one project's
specific debugging need (e.g. a platform-specific CLI's quirks) stays in that project unless a
second project hits the same need.

## Adding one

1. Copy the skill's `SKILL.md` here under `skills/<name>/`.
2. Strip anything project-specific (actor/project names, specific file paths) — replace with
   placeholders or a short "adapt this to your project" note.
3. Note here which project(s) it's been used in.
