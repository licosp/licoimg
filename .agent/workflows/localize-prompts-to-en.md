---
description: Translate Japanese prompt files back to English
---

# Localize Prompts to English Workflow

## Purpose
Translate Japanese prompt files from `.agent/locales/ja/` back to English and update the main files in `.agent/rules` and `.agent/workflows`.

## Steps

### 1. Translate & Overwrite
Translate Japanese files to English and overwrite the main files.

- **Rules**: `.agent/locales/ja/rules/*.md` → `.agent/rules/*.md`
- **Workflows**: `.agent/locales/ja/workflows/*.md` → `.agent/workflows/*.md`

> [!WARNING]
> This overwrites existing English files. Commit changes before running.

### 2. Guidelines
- **Language**: Natural, professional English.
- **Terms**: Standard technical terminology.
- **Structure**: Preserve YAML front-matter, headings, and code blocks.

### 3. Verify
- Ensure accurate translation and correct formatting.
- Commit and push changes.