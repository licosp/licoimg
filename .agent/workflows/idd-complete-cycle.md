---
description: Complete workflow for one full Issue-Driven Development (IDD) cycle
---

# Issue-Driven Development: Complete Cycle

## Overview
IDD (Issue-Driven Development) is structured into **3 main phases**:
1. **Initialization** (開始処理): Prepare the work environment
2. **Implementation** (イシューのテーマの実現): Achieve the issue's goal
3. **Finalization** (終了処理): Integrate and close the issue

---

## Phase 1: Initialization (開始処理)

### 1. Environment Verification
**1-1. Tool Availability Check**
```bash
# Check required tools
command -v gh &> /dev/null || echo "Error: GitHub CLI not installed"
command -v git &> /dev/null || echo "Error: Git not installed"
```

**1-2. Authentication Status**
```bash
gh auth status || echo "Error: Not authenticated. Run 'gh auth login'"
```

### 2. Theme Design
**2-1. Define Main Theme**
- Identify the primary goal of the issue (e.g., "Add pre-task assessment protocol")
- Ensure the theme is clear and focused

**2-2. Identify Sub-Themes**
- List changes unrelated to the main theme but necessary for synchronization
- Examples: Draft updates, `.gitignore` adjustments, typo fixes
- **Note**: Sub-themes will be committed separately (ref: `commit-granularity.md`)

### 3. Issue Creation
**3-1. Prepare Issue Elements**
- **Title**: `[Type]: Brief description` (e.g., `[Feat]: Add pre-task assessment`)
- **Body**: Summary, Changes, Purpose
- **Assignees**: Assign to yourself or team members
- **Labels**: Match commit type (`feat`, `fix`, `docs`, etc.)

**3-2. Create Issue**
```bash
gh issue create \
  --title "[Feat]: Add pre-task assessment protocol" \
  --body "## Summary\n...\n\n## Changes\n...\n\n## Purpose\n..." \
  --label "type:feat"
```

**3-3. Record Issue Number**
```bash
ISSUE_NUMBER=$(gh issue list --limit 1 --json number --jq '.[0].number')
echo "Working on Issue #$ISSUE_NUMBER"
```

### 4. Branch Creation
**4-1. Fetch Latest Remote State**
```bash
git fetch origin
```

**4-2. Create Local Branch from Remote Main**
```bash
git checkout -b ${ISSUE_NUMBER}-brief-description-kebab-case origin/main
```

**Naming Convention** (ref: `git-operations.md` §3.1):
- Format: `<issue-number>-<issue-title-kebab-case>`
- Language: English
- Length: ~50 characters

**4-3. Push Branch and Set Upstream Tracking**
```bash
git push -u origin ${ISSUE_NUMBER}-brief-description-kebab-case
```

### 5. Initial State Verification
**5-1. Check Current Branch Status**
```bash
git status
```

**5-2. Verify Feasibility**
- Confirm that main theme and sub-themes can be implemented
- Check for potential conflicts or blockers

### 6. Early Problem Detection
**6-1. Identify Issues**
- List any problems discovered during verification
- Document technical constraints or dependencies

**6-2. Record in Issue Comments**
```bash
gh issue comment ${ISSUE_NUMBER} --body "## Initial Assessment\n- Problem: ...\n- Solution: ..."
```

**6-3. Backup Issue Locally**
```bash
gh issue view ${ISSUE_NUMBER} --json title,body,comments > .agent/issues/issue-${ISSUE_NUMBER}-backup.json
```

---

## Phase 2: Implementation (イシューのテーマの実現)

### Development Cycle
Repeat the following until all planned work is complete:

**1. Make Changes**
- Implement features, fix bugs, or update documentation
- Focus on one logical change at a time

**2. Stage Changes**
```bash
git add <files>
```

**3. Verify Staging**
```bash
git diff --cached --stat
git diff --cached
```

**4. Commit**
```bash
git commit -m "type(scope): description"
```

**Commit Standards** (ref: `git-operations.md` §1-2, `commit-granularity.md`):
- Use Conventional Commits format
- Keep commits atomic (1 logical change per commit)
- Commit main theme and sub-themes **separately**
- Commit frequently (especially for drafts and logs)

**5. Iterate**
- Continue until all main theme and sub-theme work is complete

---

## Phase 3: Finalization (終了処理)

### 1. Pre-Push Documentation
**1-1. Generate Commit Summary**
```bash
git log --oneline origin/main..HEAD --pretty=format:"- \`%h\` %s" > /tmp/commit-summary.md
```

**1-2. Add Context**
Edit `/tmp/commit-summary.md` to include:
- Timestamp (ISO 8601 format)
- Brief summary of changes
- Next steps (if applicable)

**Example**:
```markdown
## Commit History (2025-12-01T10:45+09:00)

Completed 5 atomic commits:

- \`a1b2c3d\` feat(rules): add pre-task assessment protocol
- \`b2c3d4e\` docs(rules): update commit granularity philosophy
- \`c3d4e5f\` docs(workflow): add IDD complete cycle
- \`d4e5f6g\` docs: update daily draft with IDD discussion
- \`e5f6g7h\` chore: update .gitignore

**Summary**: Added behavioral rules and workflows for IDD cycle.
**Next Steps**: Create PR and merge to main.
```

**1-3. Post to Issue**
```bash
gh issue comment ${ISSUE_NUMBER} --body-file /tmp/commit-summary.md
```

**1-4. Verify Comment**
```bash
gh issue view ${ISSUE_NUMBER}
```

### 2. Push Branch
```bash
git push origin ${ISSUE_NUMBER}-brief-description-kebab-case
```

### 3. Create Pull Request
```bash
gh pr create \
  --title "Brief description of changes" \
  --body "Closes #${ISSUE_NUMBER}.\n\n## Changes\n- [List]\n\n## Testing\n- [Verification steps]" \
  --base main \
  --head ${ISSUE_NUMBER}-brief-description-kebab-case
```

**PR Requirements**:
- Include `Closes #<issue-number>` to auto-close issue on merge
- Use **relative paths only** (security requirement)
- Summarize main theme and sub-themes clearly

**Record PR Number**:
```bash
PR_NUMBER=$(gh pr list --head ${ISSUE_NUMBER}-brief-description-kebab-case --json number --jq '.[0].number')
echo "Created PR #$PR_NUMBER"
```

### 4. Review & Merge
**4-1. Review (if needed)**
- Human reviewer checks changes
- CI/CD runs automated tests (if configured)
- Address feedback with additional commits if needed

**4-2. Merge Pull Request**
```bash
gh pr merge ${PR_NUMBER} --squash --delete-branch
```

**Merge Options**:
- `--squash`: Combine all commits into one (recommended for clean history)
- `--merge`: Standard merge commit
- `--rebase`: Rebase and merge
- `--delete-branch`: Auto-delete remote branch after merge

### 5. Local Cleanup
**5-1. Switch to Main**
```bash
git checkout main
```

**5-2. Pull Latest Changes**
```bash
git pull origin main
```

**5-3. Delete Local Branch**
```bash
git branch -d ${ISSUE_NUMBER}-brief-description-kebab-case
```

### 6. Issue Closure Verification
**6-1. Verify Auto-Closure**
```bash
gh issue view ${ISSUE_NUMBER}
```

**Expected**: Status should be "Closed" (auto-closed by PR merge).

**6-2. Manual Closure (if needed)**
```bash
gh issue close ${ISSUE_NUMBER} --comment "Completed via PR #${PR_NUMBER}"
```

---

## Phase 4: Next Cycle

### Start New Work
**1. Identify Next Issue**
```bash
gh issue list
```

**2. Return to Phase 1**
Begin a new IDD cycle with the next issue.

---

## Quick Reference Checklist

### Phase 1: Initialization
- [ ] Verify tools and authentication
- [ ] Define main theme and sub-themes
- [ ] Create issue
- [ ] Create branch from `origin/main`
- [ ] Push branch and set upstream
- [ ] Verify feasibility
- [ ] Document problems (if any)

### Phase 2: Implementation
- [ ] Make changes
- [ ] Stage and verify
- [ ] Commit (atomic, frequent)
- [ ] Repeat until complete

### Phase 3: Finalization
- [ ] Generate commit summary
- [ ] Post to issue
- [ ] Push branch
- [ ] Create PR
- [ ] Review and merge
- [ ] Clean up local workspace
- [ ] Verify issue closure

---

## Error Handling

### Missing Tools
```bash
command -v gh &> /dev/null || echo "Error: GitHub CLI not installed"
```

### Authentication Issues
```bash
gh auth status || echo "Error: Not authenticated. Run 'gh auth login'"
```

### Merge Conflicts
If conflicts occur:
1. Stop work immediately
2. Create conflict resolution plan (ref: `git-operations.md` §5.2)
3. Resolve conflicts manually
4. Resume workflow

---

## References
- `git-operations.md` - Git standards and conventions
- `commit-granularity.md` - Atomic commit philosophy
- `prepare-commit.md` - Pre-commit preparation workflow
- [GitHub CLI Documentation](https://cli.github.com/manual/)

---
*Generated by Lico (Model: Claude 3.5 Sonnet) on 2025-12-01*
