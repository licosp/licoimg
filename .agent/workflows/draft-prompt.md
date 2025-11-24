---
description: Create a new prompt draft
---

# Create Prompt Draft

This workflow creates a new prompt draft file in `.agent/.draft/` with timestamp-based naming.

## Steps

1. Create the `.agent/.draft/` directory if it doesn't exist:
```bash
mkdir -p .agent/.draft
```

// turbo
2. Create a new draft file with the current timestamp:
```bash
cat > .agent/.draft/draft_$(date +%Y-%m-%d_%H%M%S).md << 'EOF'
---
date: $(date +%Y-%m-%d %H:%M:%S)
user: $(whoami)
---

## Prompt

[Write your instruction to Ai here]

## Additional Notes

[Background information, expected results, context, etc.]
EOF
```

3. The draft file will be created at: `.agent/.draft/draft_YYYY-MM-DD_HHMMSS.md`

## File Naming Convention

- Format: `draft_YYYY-MM-DD_HHMMSS.md`
- Example: `draft_2025-11-24_161853.md`
