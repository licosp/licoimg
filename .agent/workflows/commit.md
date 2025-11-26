---
description: Identify and consolidate repository changes into logical atomic commits
---

# Commit Workflow

## Purpose
Identify uncommitted changes, group them logically (by feature, fix, refactor, etc.), and create clear, atomic commits.

## Steps

### 1. Investigation
- Run `git status` and `git diff` to analyze changes.
- Group related changes together (e.g., by feature or bug fix).

### 2. Staging and Committing
For each logical group:
1. **Stage**: `git add <files>` (or `git add -p` for partial staging).
2. **Commit**: `git commit -m "<message>"`
   - **Language**: English only.
   - **Format**: `<Type>: <Subject>` (e.g., `Feat: Add login page`).
   - **Types**: `Feat`, `Fix`, `Refactor`, `Docs`, `Style`, `Test`, `Chore`.
   - **Body**: Optional details or issue reference (e.g., `Closes #12`).

### 3. Review and Push
- Review history with `git log`.
- Push to remote: `git push origin main` (ensure tests pass first).
