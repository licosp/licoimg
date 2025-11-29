#!/bin/bash
# Script to merge Section 4.4 (Issue Comment Format) and Section 8 (Pre-Push Documentation)
# into .agent/rules/development/git-operations.md

set -e  # Exit on error

TARGET_FILE=".agent/rules/development/git-operations.md"
SECTION_4_4=".human/rules/development/git-operations-issue-comment-format.md"
SECTION_8=".human/rules/development/git-operations-push.md"
BACKUP_FILE="${TARGET_FILE}.backup-$(date +%Y%m%d-%H%M%S)"

echo "Creating backup: ${BACKUP_FILE}"
cp "${TARGET_FILE}" "${BACKUP_FILE}"

echo "Step 1: Adding Section 4.4 after line 167 (Section 4.3)"
# Insert Section 4.4 after line 167
sed -i '167 r '"${SECTION_4_4}" "${TARGET_FILE}"

echo "Step 2: Renumbering old Section 4.4 to Section 4.5"
# Change "#### 4.4 Idempotency" to "#### 4.5 Idempotency"
# This will appear after the newly inserted Section 4.4
sed -i 's/^#### 4\.4 Idempotency/#### 4.5 Idempotency/' "${TARGET_FILE}"

echo "Step 3: Finding new line number after Section 7.2"
# After inserting Section 4.4, Section 7.2 will be at a different line
# We need to find "#### 7.2 Commit Correction" and insert after its "---"
LINE_NUM=$(grep -n "^#### 7\.2 Commit Correction" "${TARGET_FILE}" | cut -d: -f1)
# Find the next "---" after Section 7.2
INSERT_LINE=$(awk -v start="$LINE_NUM" 'NR>start && /^---$/{print NR; exit}' "${TARGET_FILE}")

echo "Step 4: Adding Section 8 after line ${INSERT_LINE}"
# Insert Section 8 before the "---" line
sed -i "${INSERT_LINE} r ${SECTION_8}" "${TARGET_FILE}"

echo "Done! Backup saved to: ${BACKUP_FILE}"
echo "Modified file: ${TARGET_FILE}"
echo ""
echo "Verify changes with:"
echo "  grep -A 5 '#### 4.4 Issue Comment Format' ${TARGET_FILE}"
echo "  grep -A 5 '#### 4.5 Idempotency' ${TARGET_FILE}"
echo "  grep -A 5 '### 8. Pre-Push Documentation' ${TARGET_FILE}"
