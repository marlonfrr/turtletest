import 'dart:convert';

Comment commentFromMap(String str) => Comment.fromMap(json.decode(str));

String commentToMap(Comment data) => json.encode(data.toMap());

class Comment {
  Comment({
    required this.timestamp,
    required this.comment,
  });

  final int timestamp;
  final String comment;

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
        timestamp: json["timestamp"],
        comment: json["comment"],
      );

  Map<String, dynamic> toMap() => {
        "timestamp": timestamp,
        "comment": comment,
      };
}
