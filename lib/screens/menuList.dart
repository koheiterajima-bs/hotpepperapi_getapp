import 'package:flutter/material.dart';
import 'reviewConfirm.dart';
import 'search.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
            const SizedBox(height: 40),
            ElevatedButton(
                child: Text("ログアウトする"),
                onPressed: () async {
                  try {
                    print("ログアウトしました");
                    // Firebaseからサインアウト
                    await FirebaseAuth.instance.signOut();
                    // サインアウト後、ログイン画面に遷移
                    await Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }),
                    );
                  } catch (e) {
                    print("エラー内容: $e");
                    // エラーメッセージを表示
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("ログアウトに失敗しました"),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
