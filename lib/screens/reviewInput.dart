import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'menuList.dart';

// お気に入り&レビュー入力
class ReviewInputPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お気に入り登録&レビュー入力",
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
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                  'レビューするお店の名前：${ref.read(selectedShopProvider) ?? ref.read(selectedShopProvider2) ?? '未選択です'}'),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(labelText: "レビュー入力"),
                onChanged: (String value) {
                  // ユーザーの入力をProviderに保存
                  ref.watch(reviewInputProvider.notifier).state = value;
                },
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                child: Text("レビュー登録する"),
                onPressed: () async {
                  print("レビューを投稿しました");

                  // 一意のUUIDを取得
                  final uuid = ref.watch(uuidProvider);

                  // ドキュメント作成
                  await FirebaseFirestore.instance
                      .collection('reviews')
                      .doc(uuid)
                      .set({
                    'ID': ref.watch(uuidProvider),
                    'メールアドレス': ref.watch(emailProvider),
                    '店名': ref.watch(selectedShopProvider) ??
                        ref.watch(selectedShopProvider2) ??
                        '未選択です',
                    'レビュー内容': ref.watch(reviewInputProvider),
                  });
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return MenuPage();
                  }));
                }),
          ],
        ),
      ),
    );
  }
}
