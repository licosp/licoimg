---
description: Refine and standardize AI instruction files
---

# Refine Instructions Workflow

## Purpose
Refine Markdown instruction files (`.md`) in `.agent/rules/` and `.agent/workflows/` to ensure they are clear, concise, and complete for AI agents (Lico).

## Steps

### 1. Analysis
Read target file and identify:
- **Ambiguity**: Unclear instructions or formatting.
- **Redundancy**: Repeated information or unnecessary verbosity.
- **Gaps**: Missing context, steps, or requirements.

### 2. Refine and Overwrite
Rewrite file in **English** with these goals:
- **Format**: Use clear structure (Purpose, Steps, Guidelines/Additional Info).
- **Conciseness**: Remove fluff, use bullet points and imperative mood.
- **Completeness**: Fill in missing details (e.g., specific commands, directory paths).
- **Consistency**: Ensure terminology aligns with other agent documentation.

### 3. Verification
- Ensure file is easy for AI to parse and understand.
- Verify no critical information was lost during simplification.
- Commit changes.
