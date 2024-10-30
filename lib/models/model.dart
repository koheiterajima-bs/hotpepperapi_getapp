// APIから取得するデータを表すデータクラス

class Post {
  final String id;
  final String name;
  final String address;

  Post({required this.id, required this.name, required this.address});

  // 特定の条件に基づいてインスタンスを生成したいときに使う特別なコンストラクタ
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      name: json['name'],
      address: json['address'],
    );
  }
}
