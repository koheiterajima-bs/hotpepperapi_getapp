# hotpepper_app

## メモ
- Firebaseにログイン機能を実装するまで
https://firebase.google.com/docs/flutter/setup?hl=ja&platform=ios

## 進捗
- 各ページへの遷移->完
- ログイン機能の実装->完
- とりあえずAPI通信させる→完
- ボタンを押した時にAPI通信を行う→完
- パスワードエラー、検索結果エラーを出せるように→完
- 検索結果をクリックできるようにする→
- クリックしたお店の名前を用い、レビュー入力画面に反映→
- レビューに保存→


## 何ができないか
- APIから取得する際にRiverpodの非同期処理の結果を管理するFutureProviderを用い取得しようとしているが、使用方法がいまいちわからない、、→解決
  - main.dartにて、main関数でProviderScopeを設定する
  - APIから取得するデータを表すモデルクラスを定義する
  - APIへのアクセスやデータ取得ロジックを設定する
  - APIからデータを取得するためのFutureProviderを定義する
  - UIにてConsumerWidgetを使う
- API取得はできたが、ページ読み込み時ではなく、ボタンを押したときに表示されるようにしたい
  - FutureProviderではなく、StateNotifierを用いてAPIを非同期で取得して保持する？