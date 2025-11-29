# Commit Granularity (Atomic Commits)

## Purpose
Ensure every commit is fine‑grained so that the reason for each file change is traceable.

## Rules
- **MUST** keep commit granularity fine‑grained; a single file per commit is acceptable.
- **MUST** write the commit message so that it clearly explains *why* the file was changed.
- **MUST NOT** combine unrelated file changes in one commit.
- **MUST** verify staged content with `git diff --cached --stat` before committing.
- **MUST** use `git restore --staged <file>` to unstage any unrelated files.

## Rationale
Fine‑grained commits make it easy to track the motivation behind each change, simplify roll‑backs, and improve code review clarity.
