import 'package:flutter/material.dart';

// お気に入り&レビュー確認
class ReviewConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お気に入り登録&レビュー確認",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: EdgeInsets.all(10), // カードの周りの余白
              color: Colors.red,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'お店の名前 1',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'ここは美味しいです 1',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10), // カードの周りの余白
              color: Colors.red,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'お店の名前 2',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'ここは美味しいです 2',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(10), // カードの周りの余白
              color: Colors.red,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.white),
                    title: Text(
                      'お店の名前 3',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      'ここは美味しいです 3',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
