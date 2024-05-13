# img2Logo: 画像解析によるロゴ生成

`img2Logo` は、機械学習と画像解析技術を活用して、指定された画像からロゴを生成するツールです。

## 主な機能

- **画像からのテキスト解析**: 与えられた画像の内容を解析し、関連するテキストを抽出します。
- **ロゴ生成**: 解析されたテキストを基にして、様々なスタイルのロゴを生成します。
- **カスタマイズ可能**: 生成されるロゴの名詞スタイルやをユーザーが選択可能です。

## 技術スタック

- Python
- PyTorch, torchvision
- CLIP (Contrastive Language–Image Pre-training)
- Stable Diffusion
- NLTK (Natural Language Toolkit)

## インストール方法

このノートブックを実行するには、リポジトリのルートにある `environment.yml` と `dockerfile` を使用して、必要な環境をセットアップできます。

