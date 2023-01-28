class Books {
  int? userId;
  int? id;
  String title;
  String body;

  Books({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Books.fromJson(Map<String, dynamic> json) {
    return Books(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}
