# ルールメンテナンス

## 目的
`.agent/rules/README.md`のインデックスを実際のルールファイルと同期させます。

## ルール

### 1. 新しいルールファイルを作成した後
**必ず**`.agent/rules/README.md`を更新して、適切なセクションに新しいファイルを含めてください。

**手順**:
1. 適切なディレクトリ（`core/`、`development/`、`projects/`、または`workflow/`）に新しいルールファイルを作成する
2. `README.md`のセクション内にアルファベット順でエントリを追加する
3. 形式を使用する：`- [表示名](relative/path/to/file.md)`

**例**:
```markdown
## Core
- [Communication](core/communication.md)
- [Documentation Granularity](core/documentation-granularity.md)  ← 新しいエントリ
- [Identity](core/identity.md)
```

### 2. ルールファイル名を変更した後
**必ず**`README.md`の対応するリンクを更新してください。

### 3. ルールファイルを削除した後
**必ず**`README.md`から対応するエントリを削除してください。

### 4. ディレクトリ構造を再編成した後
**必ず**`README.md`内のすべての影響を受けるパスを更新してください。

## 検証
`.agent/rules/`に変更を加えた後：
- `README.md`内のすべてのリンクが既存のファイルを指しているか確認する
- サブディレクトリ内のすべての`.md`ファイルが`README.md`にリストされているか確認する
- 各セクション内のアルファベット順を確認する

## 参照
[ドキュメント粒度](../core/documentation-granularity.md)で定義されている粒度標準に従ってください。
