# Git Push Standards

## Purpose
Ensure code is safe and verified before sharing with the remote repository.

## Rules

### 1. Pre-Push Verification
- **Tests**: Ensure all tests pass before pushing.
- **Linting**: Ensure code meets quality standards.
- **History**: Verify `git log` to ensure commits are clean and correct.

### 2. Execution
- **Command**: Use `git push origin <branch>`.
- **Force Push**: **Avoid** `git push -f` unless absolutely necessary and you are the only one working on the branch.
