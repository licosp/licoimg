#!/usr/bin/env bash
set -euo pipefail

# ------------------------------------------------------------
# Configuration
# ------------------------------------------------------------
REPO="licosp/licoproj"
ISSUE_NUMBER=4
EXPECTED_BRANCH="4-improve-workspace-tooling-and-development-environment"

# Resolve the path to the gh binary (relative to this script)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
GH_BIN="${SCRIPT_DIR}/../runtimes/gh_2.40.1_linux_amd64/bin/gh"

# Check if gh binary exists
if [[ ! -x "$GH_BIN" ]]; then
  echo "❌ gh binary not found or not executable at $GH_BIN" >&2
  exit 1
fi

echo "ℹ️  Using gh binary at: $GH_BIN"

# ------------------------------------------------------------
# 1. Verify that the Issue exists on GitHub
# ------------------------------------------------------------
if "$GH_BIN" issue list --repo "$REPO" | grep -q "^$ISSUE_NUMBER\b"; then
  echo "✅ Issue #${ISSUE_NUMBER} exists."
else
  echo "❌ Issue #${ISSUE_NUMBER} not found or not accessible. Exiting." >&2
  exit 1
fi

# ------------------------------------------------------------
# 2. Ensure the related branch exists locally and is checked out
# ------------------------------------------------------------
if ! git show-ref --verify --quiet "refs/heads/${EXPECTED_BRANCH}"; then
  echo "⚠️ Branch ${EXPECTED_BRANCH} not found locally. Creating from remote."
  git checkout -b "${EXPECTED_BRANCH}" "origin/${EXPECTED_BRANCH}"
fi

git checkout "${EXPECTED_BRANCH}"
echo "✅ Current branch is ${EXPECTED_BRANCH}."

# ------------------------------------------------------------
# 3. Prepare the comment body
# ------------------------------------------------------------
read -r -d '' COMMENT <<'EOF'
## Plan change notice

- The Issue title has been changed to "Repository local ↔ remote synchronization".
- This change focuses on synchronizing the local repository with the remote, temporarily pausing the previous tooling improvement plan.

Please review and let me know if any additional tasks are required.
EOF

# ------------------------------------------------------------
# 4. Post the comment to the GitHub Issue
# ------------------------------------------------------------
"$GH_BIN" issue comment "$ISSUE_NUMBER" --repo "$REPO" --body "$COMMENT" \
  && echo "✅ Comment posted to Issue #${ISSUE_NUMBER}." \
  || { echo "❌ Failed to post comment." >&2; exit 1; }

