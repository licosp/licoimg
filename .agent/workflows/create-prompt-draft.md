---
description: Create a new prompt draft with a timestamped filename
---

# Create Prompt Draft Workflow

## Purpose
Generate a new Markdown draft file in `.agent/.draft/` for writing AI instructions.

## Steps

1. **Create Directory** (if missing)
   ```bash
   mkdir -p .agent/.draft
   ```

2. **Generate File**
   Run the following to create a timestamped draft:
   ```bash
   cat > .agent/.draft/draft_$(date -Iseconds).md << 'EOF'
   ---
   date: $(date -Iseconds)
   user: $(whoami)
   ---

   ## Prompt
   [Enter your instructions for Ai here]

   ## Notes
   [Optional context, background, or expected results]
   EOF
   ```

## Output
- **Path**: `.agent/.draft/draft_YYYY-MM-DDTHH:MM:SS+HH:MM.md`
- **Usage**: Edit the `## Prompt` section to instruct the agent.
