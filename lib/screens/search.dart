import 'package:flutter/material.dart';
import 'reviewInput.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/provider.dart';

// お店検索機能
class SearchPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final searchQuery = ref.watch(searchQueryProvider);
    final postsAsyncValue = ref.watch(postsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "お店検索機能",
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
              child: Text('お店の名前で検索する'),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "例：松屋"),
                  onChanged: (String value) {
                    // ユーザーの入力をProviderに保存
                    ref.watch(searchQueryProvider.notifier).state = value;
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('$searchQuery'),
            ),
            ElevatedButton(
              child: Text("検索"),
              onPressed: () async {
                Text('検索ボタンが押されました');
              },
            ),
            // 検索結果を表示
            Expanded(
              child: postsAsyncValue.when(
                data: (posts) {
                  return ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return ListTile(
                          title: Text(post.name),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(post.address),
                              Text(post.id),
                            ],
                          ),
                        );
                      });
                },
                loading: () => Center(child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error: $err')),
              ),
            ),
            const SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('フリーワードで検索する'),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                // テキスト入力のラベルを設定
                decoration: InputDecoration(
                    labelText: "例：店名、住所、駅名、お店ジャンル、キャッチなどのキーワード検索"),
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
                child: Text("レビュー入力に進む"),
                onPressed: () {
                  print("レビュー入力に進みます");
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return ReviewInputPage();
                    }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

/*
メモ
- 本当はドロップダウンメニューにしたい
- この検索ボックスの下に検索結果が出るようにしたい
*/