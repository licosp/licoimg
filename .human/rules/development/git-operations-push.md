---

### 8. Pre-Push Documentation

#### 8.1 Issue Comment Requirement
**MUST** document commit history on GitHub Issue before pushing:

1. **Generate commit summary**:
   ```bash
   git log --oneline origin/<branch>..HEAD --pretty=format:"- %h %s"
   ```

2. **Post to Issue**:
   ```bash
   # Using gh CLI with full path
   .agent/runtimes/gh_2.40.1_linux_amd64/bin/gh issue comment <issue-number> --body-file <summary-file>
   # OR manually via GitHub web UI
   ```

3. **Verify comment posted**:
   ```bash
   .agent/runtimes/gh_2.40.1_linux_amd64/bin/gh issue view <issue-number>
   ```

#### 8.2 Push Execution
**MUST** push after documenting commits:
```bash
git push origin <branch-name>
```

#### 8.3 Rationale
- **Traceability**: Links commits to Issue discussion
- **Audit Trail**: Provides historical record of work completed
- **Collaboration**: Informs team members of progress
- **Migration Support**: Preserves commit history if moving to different hosting service

---
