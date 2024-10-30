import 'package:flutter/material.dart';
import 'reviewConfirm.dart';
import 'search.dart';

// お気に入り&レビュー入力
class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hotpepper Review Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                child: Text("レビューしたいお店を検索する"),
                onPressed: () {
                  print("レビューしたいお店を検索するボタンが押されました");
                  // 検索画面に推移
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return SearchPage();
                    }),
                  );
                }),
            const SizedBox(height: 15),
            ElevatedButton(
                child: Text("レビューしたお店一覧を見る"),
                onPressed: () {
                  print("レビューしたお店一覧を見るボタンが押されました");
                  // レビュー一覧ページに推移
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ReviewConfirmPage();
                    }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
