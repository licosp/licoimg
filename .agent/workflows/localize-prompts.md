---
description: Translate English prompt files to Japanese and store them in a localization directory
---

# Localize Prompts Workflow

This workflow translates prompt files located in `.agent/rules` and `.agent/workflows` from English to Japanese, storing the translated files under `.agent/locales/ja/`.

## Goal

- Provide Japanese versions of the agent’s prompts for localized documentation.
- Establish a directory structure that easily supports additional languages in the future.

## Target Files

- **All `.md` files** in the repository (both rules and workflows).

## Output Directory

Translated files are saved to:

- `.agent/locales/ja/rules/` – Japanese versions of rule files
- `.agent/locales/ja/workflows/` – Japanese versions of workflow files

This layout makes it simple to add other language directories such as `en/` or `zh/` later.

## Translation Guidelines

1. **Technical Terms**
   - Keep terms like `commit`, `workflow`, `git` in Katakana (e.g., コミット, ワークフロー) when appropriate.
2. **Structure Preservation**
   - Preserve the YAML front‑matter (`---` block) and all Markdown headings, lists, and code blocks.
   - Do **not** modify command examples (e.g., `git status`).
3. **Tone**
   - Use a polite, explanatory style; keep bullet points concise.

## Steps

### Step 1: Create Directory Structure

```bash
mkdir -p .agent/locales/ja/rules
mkdir -p .agent/locales/ja/workflows
```

### Step 2: Translate Rule Files

- `agent-code-of-conduct.md` → `.agent/locales/ja/rules/agent-code-of-conduct.md`
- `packages-coding-conventions.md` → `.agent/locales/ja/rules/packages-coding-conventions.md`

### Step 3: Translate Workflow Files

- `commit.md` → `.agent/locales/ja/workflows/commit.md`
- `create-prompt-draft.md` → `.agent/locales/ja/workflows/create-prompt-draft.md`
- `localize-prompts.md` → `.agent/locales/ja/workflows/localize-prompts.md`

### Step 4: Verify Translations

- Ensure translations are accurate.
- Check that Markdown formatting is preserved.
- Confirm that command examples and code blocks remain unchanged.
