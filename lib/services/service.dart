// APIへのアクセスやデータ取得ロジック

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class ApiService {
  Future<List<Post>> fetchPosts(String query) async {
    // クエリパラメータとして検索キーワードを追加
    final url = Uri.parse(
      'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/'
      '?key=2265e4060f4b196b&name=$query&count=100&order=4&format=json',
    );

    // HTTPリクエストを送る
    final response = await http.get(url);

    // ステータスコードで応答チェック
    if (response.statusCode == 200) {
      // 取得したJSON形式をDartのオブジェクト形式に変換
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // "shop"キーのリストを取得
      List<dynamic> shopList = jsonResponse['results']['shop'];

      if (shopList.isEmpty) {
        throw Exception('一致するお店の名前が見つかりませんでした');
      }

      // JSONデータからPostリストを作成
      return shopList.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

class FreewordApiService {
  Future<List<Post>> freewordFetchPosts(String query) async {
    // クエリパラメータとして検索キーワードを追加
    final url = Uri.parse(
      'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/'
      '?key=2265e4060f4b196b&keyword=$query&count=100&order=4&format=json',
    );

    // HTTPリクエストを送る
    final response = await http.get(url);

    // ステータスコードで応答チェック
    if (response.statusCode == 200) {
      // 取得したJSON形式をDartのオブジェクト形式に変換
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // "shop"キーのリストを取得
      List<dynamic> shopList = jsonResponse['results']['shop'];

      if (shopList.isEmpty) {
        throw Exception('このワードでは見つかりませんでした');
      }
      // JSONデータからPostリストを作成
      return shopList.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
