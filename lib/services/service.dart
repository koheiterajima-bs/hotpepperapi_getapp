// APIへのアクセスやデータ取得ロジック

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class ApiService {
  Future<List<Post>> fetchPosts() async {
    // HTTPリクエストを送る
    final response = await http.get(Uri.parse(
        'https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=2265e4060f4b196b&name=方南町&format=json'));

    // ステータスコードで応答をチェック
    if (response.statusCode == 200) {
      // 取得したJSON形式をDartのオブジェクト形式に変換
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // "shop"キーのリストを取得
      List<dynamic> shopList = jsonResponse['results']['shop'];
      // JSONデータからPostリストを作成
      return shopList.map((data) => Post.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
