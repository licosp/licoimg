# Git Commit Standards

## Purpose
Ensure clear, atomic, and logical history of changes.

## Rules

### 1. Investigation
- **Always** run `git status` and `git diff` before committing.
- **Group** changes logically (feature, fix, refactor). Do not mix unrelated changes.

### 2. Commit Messages
- **Language**: English only.
- **Format**: Follow Conventional Commits: `<Type>: <Subject>`
  - Types: `Feat`, `Fix`, `Refactor`, `Docs`, `Style`, `Test`, `Chore`.
  - Example: `Feat: Add login page`
- **Body**: Optional. Use for details or issue references (e.g., `Closes #12`).

### 3. Local Verification
- **Verify** the commit history with `git log` after committing to ensure the message and content are correct.
