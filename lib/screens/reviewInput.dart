import 'package:flutter/material.dart';

// お気に入り&レビュー入力
class ReviewInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お気に入り登録&レビュー入力",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('ここにお店の名前が入ります'),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(labelText: "レビュー入力"),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                child: Text("レビュー登録する"),
                onPressed: () {
                  print("レビューを投稿しました");
                }),
          ],
        ),
      ),
    );
  }
}
