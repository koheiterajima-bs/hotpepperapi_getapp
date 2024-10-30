import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/login.dart';
import 'screens/reviewConfirm.dart';
import 'screens/reviewInput.dart';
import 'screens/search.dart';
import 'screens/menuList.dart';
import 'screens/dummy.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Firebaseの初期化が完了するまでに他の処理を開始しないように非同期にする
Future<void> main() async {
  // Flutterアプリケーションが実行される前にウィジェットバインディングを初期化
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print("Firebaseの初期化に失敗しました: $e");
  }

  runApp(
    // Riverpodでデータを受け渡しできる状態にする
    ProviderScope(
      child: HotpepperApp(),
    ),
  );
}

// GoRouterの設定
GoRouter router() {
  return GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/menu-list',
        builder: (context, state) => MenuPage(),
      ),
      GoRoute(
        path: '/search',
        builder: (context, state) => SearchPage(),
      ),
      GoRoute(
        path: '/review-input',
        builder: (context, state) => ReviewInputPage(),
      ),
      GoRoute(
        path: '/review-confirm',
        builder: (context, state) => ReviewConfirmPage(),
      ),
      GoRoute(
        path: '/dummy-page',
        builder: (context, state) => DummyPage(),
      ),
    ],
  );
}

class HotpepperApp extends StatelessWidget {
  const HotpepperApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // アプリ名
      title: 'Hotpepper Review Page',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.red,
      ),
      // GoRouterのインスタンスを渡す
      routerConfig: router(),
    );
  }
}
