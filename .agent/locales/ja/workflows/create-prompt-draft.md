---
description: 日付ベースのファイル名で新しいプロンプトドラフトを作成する
---

# プロンプトドラフト作成ワークフロー

## 目的
AIへの指示を書くための新しいMarkdownドラフトファイルを `.agent/.draft/` に生成します。

## 手順

1. **ディレクトリの作成**（存在しない場合）
   ```bash
   mkdir -p .agent/.draft
   ```

2. **ファイルの生成**
   以下を実行して、日付付きのドラフトを作成します：
   ```bash
   cat > .agent/.draft/draft_$(date +%Y-%m-%d).md << 'EOF'
   ---
   date: $(date -Iseconds)
   user: $(whoami)
   ---

   ## Prompt
   [Enter your instructions for Ai here]


   EOF
   ```

## 出力
- **パス**: `.agent/.draft/draft_YYYY-MM-DD.md`
- **使用法**: `## Prompt` セクションを編集してエージェントに指示します。
