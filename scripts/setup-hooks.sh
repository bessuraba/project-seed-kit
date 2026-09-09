#!/usr/bin/env bash
# Wires .githooks/pre-commit into git. Run once after cloning (or after copying .githooks/ into a
# new project). Stack-agnostic — no package manager involved, just git itself.
set -euo pipefail
git config core.hooksPath .githooks
echo "Hooks wired: .githooks/pre-commit will now run on every commit."
