class Contents {
  final String cid;
  final String content;
  final int status;
  final DateTime createdAt;
  final String createdId;
  final DateTime? updatedAt;
  final String? updatedId;

  Contents({
    required this.cid,
    required this.content,
    required this.status,
    required this.createdAt,
    required this.createdId,
    this.updatedAt,
    this.updatedId,
  });

  // JSON데이터를 Dart 객체로 변환
  factory Contents.fromJson(Map<String, dynamic> json) {
    return Contents(
      cid: json['cid'],
      content: json['content'],
      status: json['status'],
      createdAt: DateTime.parse(json['createAt']),
      createdId: json['createId'],
      updatedAt: DateTime.parse(json['updateAt']),
      updatedId: json['updateId'],
    );
  }
}
