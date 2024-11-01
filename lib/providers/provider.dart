// プロバイダー定義ファイル

import 'package:flutter/material.dart';
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

// お店の名前の検索クエリを保持するProvider
final searchQueryProvider = StateProvider.autoDispose((ref) {
  return '';
});

// お店の名前の検索における非同期状態を管理するStateNotifierProvider
final searchResultsProvider =
    StateNotifierProvider<SearchNotifier, AsyncValue<List<Post>>>(
  (ref) => SearchNotifier(),
);

class SearchNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  final ApiService apiService = ApiService();

  SearchNotifier() : super(const AsyncValue.loading());

  Future<void> fetchPosts(String query) async {
    state = const AsyncValue.loading();
    try {
      final posts = await apiService.fetchPosts(query);
      state = AsyncValue.data(posts);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

// フリーワード検索の検索クエリを保持するProvider
final freewordSearchQueryProvider = StateProvider.autoDispose((ref) {
  return '';
});

// フリーワード検索における非同期状態を管理するStateNotifierProvider
final freewordSearchResultsProvider =
    StateNotifierProvider<FreewordSearchNotifier, AsyncValue<List<Post>>>(
  (ref) => FreewordSearchNotifier(),
);

class FreewordSearchNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  final FreewordApiService freewordApiService = FreewordApiService();

  FreewordSearchNotifier() : super(const AsyncValue.loading());

  Future<void> freewordFetchPosts(String query) async {
    state = const AsyncValue.loading();
    try {
      final posts = await freewordApiService.freewordFetchPosts(query);
      state = AsyncValue.data(posts);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
