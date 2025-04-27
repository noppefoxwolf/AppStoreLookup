# AppIconIndex

App StoreのURLからアプリアイコンを簡単に取得するコマンドラインツールです。

## 概要

AppIconIndexは、App StoreのURLを指定するだけで、そのアプリの情報（バンドルID、アプリ名）と高解像度アイコン画像を取得できるシンプルなツールです。取得したアイコンは指定したディレクトリに保存されます。

## 機能

- App StoreのURLからアプリIDを抽出
- iTunes Lookup APIを使用してアプリ情報を取得
- アプリアイコン（512px）のダウンロードと保存
- バンドルIDやアプリ名などの基本情報の表示

## インストール

```bash
git clone https://github.com/noppefoxwolf/AppIconIndex.git
cd AppIconIndex
swift build -c release
sudo cp .build/release/AppIconIndex /usr/local/bin/
```

または Swift Package Managerを利用して直接実行:

```bash
swift run AppIconIndex [引数]
```

## 使い方

```bash
swift run AppIconIndex https://apps.apple.com/jp/app/アプリ名/id番号 --output 保存先ディレクトリ
```

### 例

```bash
swift run AppIconIndex https://apps.apple.com/jp/app/twitter/id333903271 --output icons
```

上記コマンドを実行すると:
1. TwitterアプリのIDを抽出
2. アプリ情報を取得して表示
3. 512pxサイズのアイコンを「icons」ディレクトリに保存（ディレクトリがない場合は自動作成）

## 要件

- Swift 6.0
- macOS 13

## ライセンス

MITライセンス

## 作者

[@noppefoxwolf](https://github.com/noppefoxwolf)


