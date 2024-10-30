import 'package:flutter/material.dart';
import '../providers/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'menuList.dart';

// ログイン画面用Widget
// ConsumerWidgetでProviderから値を受け取る
// ConsumerWidgetのbuildメソッド内でref.watchを使うことで任意のProviderから値を取得できる
// ref.readを使えば、プロバイダの状態の更新も行える
class LoginPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから値を受け取る
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final reviewText = ref.watch(reviewTextProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hotpepper Review Page",
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
              child: TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "メールアドレス入力"),
                  onChanged: (String value) {
                    // Providerから値を更新
                    ref.read(emailProvider.notifier).state = value;
                  }),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                  // テキスト入力のラベルを設定
                  decoration: InputDecoration(labelText: "パスワード入力"),
                  obscureText: true,
                  onChanged: (String value) {
                    // Providerから値を更新
                    ref.read(passwordProvider.notifier).state = value;
                  }),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              child: Text("新規登録"),
              onPressed: () async {
                try {
                  // メール/パスワードでユーザー登録
                  final FirebaseAuth auth = FirebaseAuth.instance;
                  final result = await auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  // ユーザー情報を更新
                  ref.read(userProvider.notifier).state = result.user;

                  // 一覧画面に推移
                  await Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return MenuPage();
                    }),
                  );
                } catch (e) {
                  Text('ユーザー登録に失敗しました');
                }
                print("新規登録ボタンが押されました");
              },
            ),
            const SizedBox(height: 10),
            OutlinedButton(
                child: Text("ログイン"),
                onPressed: () async {
                  try {
                    // メール/パスワードでログイン
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    final result = await auth.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );

                    // 一覧画面に推移
                    await Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return MenuPage();
                      }),
                    );

                    print("ログインに成功しました");
                  } catch (e) {
                    Text('ログインに失敗しました');
                  }
                  print("ログインボタンが押されました");
                }),
          ],
        ),
      ),
    );
  }
}
