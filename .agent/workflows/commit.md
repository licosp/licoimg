---
description: Identify repository changes and consolidate them into logical, atomic commits
---

# Commit Workflow

## Purpose
Identify uncommitted changes, group them logically (feature, fix, refactor, etc.), and create clear, atomic commits.

## Steps

### 1. Investigate
- Run `git status` and `git diff` to analyze changes.
- Group related changes (e.g., by feature or bug fix).

### 2. Stage & Commit
For each logical group:
1. **Stage**: `git add <files>` (or `git add -p` for partial staging).
2. **Commit**: `git commit -m "<message>"`
   - **Language**: English only.
   - **Format**: `<Type>: <Subject>` (e.g., `Feat: Add login page`).
   - **Types**: `Feat`, `Fix`, `Refactor`, `Docs`, `Style`, `Test`, `Chore`.
   - **Body**: Optional details or issue references (e.g., `Closes #12`).

### 3. Review & Push
- Verify history with `git log`.
- Push to remote: `git push origin main` (ensure tests pass first).
