# hotpepper_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## メモ
- Firebaseにログイン機能を実装するまで
https://firebase.google.com/docs/flutter/setup?hl=ja&platform=ios

## 進捗
- 各ページへの遷移->完
- ログイン機能の実装->完
- とりあえずAPI通信させる
- APIを用い、検索できるようにする
- 


検索結果を出力するのと、入力結果をURIに入れ込むことがriverpodでできていない状況、どうすればよいか？
API通信部分と状態管理部分を分けて記述？

## 何ができないか
- APIから取得する際にRiverpodの非同期処理の結果を管理するFutureProviderを用い取得しようとしているが、使用方法がいまいちわからない、、
  - main.dartにて、main関数でProviderScopeを設定する
  - APIから取得するデータを表すモデルクラスを定義する
  - APIへのアクセスやデータ取得ロジックを設定する
  - APIからデータを取得するためのFutureProviderを定義する
  - UIにてConsumerWidgetを使う
