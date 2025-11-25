---
description: 英語のプロンプトファイルを日本語に翻訳する
---

# プロンプトのローカライズワークフロー

## 目的
`.agent/rules` および `.agent/workflows` 内の英語のプロンプトファイル（`.md`）を日本語に翻訳し、`.agent/locales/ja/` に保存します。

## 手順

### 1. ディレクトリの作成
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
- **用語**: 技術用語（例：`commit`、`workflow`、`git`）はカタカナまたは英語のままにします。
- **構造**: YAMLフロントマター、見出し、コードブロックは保持します。
- **口調**: 丁寧な日本語（です・ます調）を使用します。

### 4. 検証
- 翻訳の正確さとMarkdownのフォーマットを確認します。
- 変更をコミットしてプッシュします。
