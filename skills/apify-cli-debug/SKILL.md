---
name: apify-cli-debug
description: Use when a GitHub-linked Apify Actor build fails, or you need build history/logs for an Actor. The Apify MCP server has no build-inspection tools (only runs/datasets/key-value stores) — this gap is filled by the `apify` CLI. Reused across Apify Actor projects unmodified — reads the actor slug from the `APIFY_ACTOR_SLUG` environment variable instead of a hardcoded value.
---

# Apify CLI — build debugging

MCP tools (`get-actor-run`, `get-dataset-items`, etc.) cover runs and storage, but **not builds**.
For build status/history/logs, use the `apify` CLI directly via Bash.

Actor slug comes from the `APIFY_ACTOR_SLUG` env var (set in `.env`, see `.env.example` at repo
root — copy it to `.env` and fill in the real `owner/actor-name` once per project; find it in
`apify.json` or the Console URL). Load it before running any command below:

```bash
set -a; source .env; set +a
```

## List recent builds

```bash
apify builds ls "$APIFY_ACTOR_SLUG" --desc --limit 5 --json
```

- `actorId` is a **positional argument**, not a `--actor` flag (also applies to `apify runs ls`).
- Each item has `status` (`SUCCEEDED`/`FAILED`/...), `buildNumber`, `id`, `startedAt`/`finishedAt`,
  and `buildTag` (only present on the build currently tagged `latest`).
- GitHub-linked Actors auto-build on push (webhook → Apify build API). `meta.origin` shows `"API"`
  for these even though they came from a push, not `"GIT"` — don't read `origin` as "manual vs.
  auto"; compare `startedAt` against your push time instead.

## Get the failing build's log

```bash
apify builds log <buildId>
```

Use the `id` field from the `builds ls` output (not `buildNumber`). Pipe to `tail -60` — logs are
verbose Docker BuildKit output; the actual error is usually in the last ~20 lines plus the
"ERROR:"/"Dockerfile:N" block right before it.

## Known failure mode: `prepare` script + no git in Docker (Node projects)

If the project has a `package.json` `prepare` script that runs `git config core.hooksPath
.githooks` (to auto-wire a local pre-commit hook on `npm install`): Apify's Docker build also runs
`npm install`, but the build image has no `git` binary and no `.git` dir. A bare `prepare` script
fails the whole build with `sh: git: not found`, `npm error code 127`, because `prepare` runs on
*any* `npm install`, container or not — this bit a real project (`sh: git: not found` on build
0.0.4, traced to exactly this).

Fix: make it non-fatal — `git config core.hooksPath .githooks 2>/dev/null || true`. If `git: not
found` shows up in a build log again, check `prepare` in `package.json` hasn't regressed back to a
bare (non-fallback) form.

## Verifying a fix landed

After pushing a fix, poll once (builds take ~10-25s):

```bash
sleep 20 && apify builds ls "$APIFY_ACTOR_SLUG" --desc --limit 2 --json
```

Confirm the newest build has `status: "SUCCEEDED"` and `buildTag: "latest"`.
