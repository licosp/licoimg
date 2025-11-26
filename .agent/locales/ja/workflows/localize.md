---
description: 英語と日本語の間でファイルを翻訳します
---

# ローカライズワークフロー

## 目的
`.agent/rules/core/localization.md` で定義された基準に従い、ドキュメントファイル（`.md`）を英語と日本語の間で翻訳します。

## 準備

必要なすべてのディレクトリが存在することを確認します：
```bash
mkdir -p .agent/{rules,workflows} .agent/locales/ja/{rules,workflows}
```

## 翻訳の方向

### 英語から日本語 (EN → JA)

- `.agent/rules/**/*.md` → `.agent/locales/ja/rules/**/*.md`
- `.agent/workflows/**/*.md` → `.agent/locales/ja/workflows/**/*.md`

### 日本語から英語 (JA → EN)

- `.agent/locales/ja/rules/**/*.md` → `.agent/rules/**/*.md`
- `.agent/locales/ja/workflows/**/*.md` → `.agent/workflows/**/*.md`

## ファイルの選択

重複する翻訳作業を避けるため、更新されたファイルのみを翻訳します：

**翻訳が必要かどうかの判断**:
- ソースファイルの最終更新時刻を宛先ファイルと比較します
- 以下の場合に翻訳します：
  - ソースファイルが宛先ファイルより新しい場合、または
  - 宛先ファイルが存在しない場合

## 検証

翻訳後、以下を確認します：
- 翻訳が元の意味と意図を保持していること
- Markdownのフォーマットが維持されていること
- 関連ドキュメント間で用語が一貫していること
- 宛先に存在するがソースに存在しないファイル/ディレクトリを削除して、宛先ディレクトリをクリーンアップすること

## ガイドライン
詳細な翻訳基準については `.agent/rules/core/localization.md` を参照してください。
