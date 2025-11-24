---
description: 英語のプロンプトファイルを日本語に翻訳する
---

# ローカライズプロンプトワークフロー

## 目的
`.agent/rules` と `.agent/workflows` にある英語のプロンプトファイル（`.md`）を日本語に翻訳し、`.agent/locales/ja/` に保存します。

## 手順

### 1. ディレクトリ作成
ターゲットディレクトリが存在することを確認します：
```bash
mkdir -p .agent/locales/ja/rules
mkdir -p .agent/locales/ja/workflows
```

### 2. 翻訳と保存
ファイルを翻訳し、対応する `ja` ディレクトリに保存します。

- **ルール**: `.agent/rules/*.md` → `.agent/locales/ja/rules/*.md`
- **ワークフロー**: `.agent/workflows/*.md` → `.agent/locales/ja/workflows/*.md`

### 3. ガイドライン
- **用語**: 技術用語（例：`commit`, `workflow`, `git`）はカタカナまたは英語のままにします。
- **構造**: YAMLフロントマター、見出し、コードブロックを保持します。
- **トーン**: 丁寧な日本語（です・ます調）。

### 4. 検証
- 翻訳の正確さとMarkdownのフォーマットを確認します。
- 変更をコミットしてプッシュします。
