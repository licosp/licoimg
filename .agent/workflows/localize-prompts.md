---
description: Translate English prompt files to Japanese
---

# Localize Prompts Workflow

## Purpose
Translate English prompt files (`.md`) in `.agent/rules` and `.agent/workflows` into Japanese and store them in `.agent/locales/ja/`.

## Steps

### 1. Create Directories
Ensure target directories exist:
```bash
mkdir -p .agent/locales/ja/rules
mkdir -p .agent/locales/ja/workflows
```

### 2. Translate & Save
Translate files and save them to the corresponding `ja` directory.

- **Rules**: `.agent/rules/*.md` → `.agent/locales/ja/rules/*.md`
- **Workflows**: `.agent/workflows/*.md` → `.agent/locales/ja/workflows/*.md`

### 3. Guidelines
- **Terms**: Keep technical terms (e.g., `commit`, `workflow`, `git`) in Katakana or English.
- **Structure**: Preserve YAML front-matter, headings, and code blocks.
- **Tone**: Polite Japanese (Desu/Masu).

### 4. Verify
- Check translation accuracy and Markdown formatting.
- Commit and push changes.
