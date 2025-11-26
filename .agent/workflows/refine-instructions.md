---
description: Refine and standardize AI instruction files
---

# Refine Instructions Workflow

## Purpose
Refine Markdown instruction files (`.md`) in `.agent/rules/` and `.agent/workflows/` to ensure they are clear, concise, and complete for the AI agent (Lico).

## Steps

### 1. Analyze
Read the target file and identify:
- **Ambiguity**: Unclear instructions or formatting.
- **Redundancy**: Repetitive information or unnecessary verbosity.
- **Gaps**: Missing context, steps, or requirements.

### 2. Refine & Overwrite
Rewrite the file in **English** with the following goals:
- **Format**: Use a clear structure (Purpose, Steps, Guidelines/Supplementary Info).
- **Conciseness**: Remove fluff; use bullet points and imperative mood.
- **Completeness**: Fill in missing details (e.g., specific commands, directory paths).
- **Consistency**: Ensure terminology aligns with other agent documents.

### 3. Verify
- Check that the file is easy for an AI to parse and understand.
- Ensure no critical information was lost during simplification.
- Commit the changes.
