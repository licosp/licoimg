---
description: IDD Phase 1 - Initialization (開始処理)
---

# IDD Phase 1: Initialization (開始処理)

> [!IMPORTANT]
> このフェーズが完了したら、**必ず停止**して次のフェーズへの移行を確認してください。
> Phase 2 へ進む場合は `/idd-phase2` を実行してください。

---

## 1. Environment Verification

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

---

## 2. Theme Design

**2-1. Define Main Theme**
- Identify the primary goal of the issue (e.g., "Add pre-task assessment protocol")
- Ensure the theme is clear and focused

**2-2. Identify Sub-Themes**
- List changes unrelated to the main theme but necessary for synchronization
- Examples: Draft updates, `.gitignore` adjustments, typo fixes
- **Note**: Sub-themes will be committed separately (ref: `commit-granularity.md`)

---

## 3. Issue Creation

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
  --assignee licosp
```

**3-3. Record Issue Number**
```bash
ISSUE_NUMBER=$(gh issue list --limit 1 --json number --jq '.[0].number')
echo "Working on Issue #$ISSUE_NUMBER"
```

**3-4. Assign Labels (after creation)**
```bash
gh issue edit ${ISSUE_NUMBER} --add-label "type:feat"
```

---

## 4. Branch Creation

> [!CAUTION]
> **必ず `origin/main` から作成すること。**
> `HEAD` や現在のブランチから作成すると、他のブランチの変更が混入します。

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

---

## 5. Initial State Verification

**5-1. Check Current Branch Status**
```bash
git status
```

**5-2. Verify Feasibility**
- Confirm that main theme and sub-themes can be implemented
- Check for potential conflicts or blockers

---

## 6. Early Problem Detection

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

## Phase 1 Complete

> **STOP**: Phase 1 が完了しました。
> Phase 2 (Implementation) へ進む場合は `/idd-phase2` を実行してください。
