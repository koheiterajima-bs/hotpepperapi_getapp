// プロバイダー定義ファイル

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/service.dart';
import '../models/model.dart';

// StateProviderを使い、変更可能なデータを渡す
// autoDisposeを付けることで自動的に値をリセットできる

// ユーザー情報の受け渡しを行うためのProvider
final userProvider = StateProvider((ref) {
  return FirebaseAuth.instance.currentUser;
});

// エラー情報の受け渡しを行うためのProvider
final infoTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// メールアドレスの受け渡しを行うためのProvider
final emailProvider = StateProvider.autoDispose((ref) {
  return '';
});

// パスワードの受け渡しを行うためのProvider
final passwordProvider = StateProvider.autoDispose((ref) {
  return '';
});

// レビューの受け渡しを行うためのProvider
final reviewTextProvider = StateProvider.autoDispose((ref) {
  return '';
});

// 検索クエリを保持するProvider
final searchQueryProvider = StateProvider.autoDispose((ref) {
  return '';
});

// APIからデータを取得する
final postsProvider = FutureProvider<List<Post>>((ref) async {
  final apiService = ApiService();
  return apiService.fetchPosts();
});
