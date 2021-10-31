class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.body,
    required this.id,
    required this.title,
    required this.userId,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        body: json["body"],
        title: json["title"],
        id: json["id"],
        userId: json["userId"],
      );
}
