import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';

// お気に入り&レビュー確認
class ReviewConfirmPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // コレクション内のドキュメント一覧を取得
    final firestoreAsyncValue = ref.watch(firestoreProvider);

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
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // コレクション内のドキュメント一覧を表示
              firestoreAsyncValue.when(
                data: (documents) {
                  // documentsが空の場合の処理
                  if (documents.docs.isEmpty) {
                    return Text('レビューがありません');
                  }

                  return Expanded(
                      child: ListView.builder(
                          itemCount: documents.docs.length,
                          itemBuilder: (context, index) {
                            final document = documents.docs[index].data()
                                as Map<String, dynamic>; // ドキュメントデータを取得
                            // return Dismissible(

                            // );
                            return Card(
                              margin: EdgeInsets.all(10),
                              color: Colors.red,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading:
                                        Icon(Icons.person, color: Colors.white),
                                    title: Column(
                                      children: [
                                        Text(
                                          'メールアドレス:${document['ID']}',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Text('店名:${document['店名']}',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text('レビュー内容:${document['レビュー内容']}',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }));
                },
                loading: () => CircularProgressIndicator(),
                error: (error, stack) => Text('エラー: $error'),
              ),
            ]),
      ),
    );
  }
}
