---
description: 英語のプロンプトファイルを日本語に翻訳し、ローカライズ用ディレクトリに配置する
---

# ローカライズプロンプトワークフロー

このワークフローは `.agent/rules` と `.agent/workflows` ディレクトリ内のプロンプトファイルを日本語に翻訳し、`.agent/locales/ja/` 配下に保存します。

## 目的

- エージェントのプロンプトを日本語化して、ローカライズされたドキュメントを提供する。
- 将来的に他言語を追加しやすいディレクトリ構造を確立する。

## 対象ファイル

- `.md`形式のファイル全て

## 出力ディレクトリ

翻訳されたファイルは以下に保存されます。

- `.agent/locales/ja/rules/` – ルールファイルの日本語版
- `.agent/locales/ja/workflows/` – ワークフローファイルの日本語版

この構造により、将来的に `en`、`zh` など他言語ディレクトリを追加しやすくなります。

## 翻訳ガイドライン

1. **専門用語**
   - `commit`、`workflow`、`git` などはカタカナ表記（例: コミット、ワークフロー）で残す。
2. **構造保持**
   - YAML フロントマター（`---` で囲まれた部分）や Markdown の見出し・リストはそのまま残す。
   - コマンド例（例: `git status`）は変更しない。
3. **文体**
   - 丁寧で説明的な口調を使用し、箇条書きは簡潔に。

## 手順

### Step 1: ディレクトリ作成

```bash
mkdir -p .agent/locales/ja/rules
mkdir -p .agent/locales/ja/workflows
```

### Step 2: ルールファイルの翻訳

- `agent-code-of-conduct.md` → `.agent/locales/ja/rules/agent-code-of-conduct.md`
- `packages-coding-conventions.md` → `.agent/locales/ja/rules/packages-coding-conventions.md`

### Step 3: ワークフローファイルの翻訳

- `commit.md` → `.agent/locales/ja/workflows/commit.md`
- `create-prompt-draft.md` → `.agent/locales/ja/workflows/create-prompt-draft.md`
- `localize-prompts.md` → `.agent/locales/ja/workflows/localize-prompts.md`

### Step 4: 翻訳の検証

- 翻訳が正確か確認する。
- Markdown のフォーマットが保持されているかチェックする。
- コマンド例やコードブロックがそのまま残っているか確認する。

## アクション

- 各翻訳ファイルをレビューし、一貫性と用語の統一を確認する。
- 必要に応じて修正を加えてコミットする。
