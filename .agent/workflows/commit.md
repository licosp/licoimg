---
description: Identify repository changes and consolidate them into logical commits
---

# Commit Workflow

## Purpose

Identify repository changes and consolidate them into logical commits.

## Task Steps

### Step 1: Investigate Changes

Identify and analyze all uncommitted changes in the repository.

**Actions:**

- Run `git status` to see modified, added, or deleted files.
- Run `git diff` to view the actual changes.
- Classify changes by purpose or component.

**Outputs:**

- Create a list grouping related changes.
- Each group represents an atomic logical commit.
- List the files affected by each group.

### Step 2: Create Commits

Create individual commits for each logical group of changes.

**Requirements:**

- Use `git add` to stage files for each commit.
- Write clear, descriptive commit messages in English.
- Follow commit‑message best practices:
  - Prefix the message with a type identifier:
    - "Feat:" for new features
    - "Fix:" for bug fixes
    - "Docs:" for documentation changes
    - "Style:" for code style changes
    - "Refactor:" for code restructuring
    - "Rest:" for adding or modifying tests
    - "Chore:" for build process or auxiliary tool changes
  - Use imperative mood (e.g., "Add feature" not "Added feature").
  - Keep the first line under 50 characters.
  - Provide additional context in the body when necessary.
  - Reference issue numbers when applicable.

**Process:**

1. Stage related files: `git add <files>`
2. Commit with a descriptive message: `git commit -m "<message>"`
3. Repeat for each logical group.

### Step 3: Review

Review the created commits.

**Actions:**

- Run `git log` to inspect commit history.
- Verify each commit is atomic and properly described.

**Verification:**

- Ensure all changes are committed.
- Confirm commit messages are clear and in English.
