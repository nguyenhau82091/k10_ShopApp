// To parse this JSON data, do
//
//     final new = newFromJson(jsonString);

import 'dart:convert';

New newFromJson(String str) => New.fromJson(json.decode(str));

String newToJson(New data) => json.encode(data.toJson());

class New {
  final String id;
  final String user;
  final String title;
  final String summary;
  final String imgMain;
  final String html;

  New({
    required this.id,
    required this.user,
    required this.title,
    required this.summary,
    required this.imgMain,
    required this.html,
  });

  factory New.fromJson(Map<String, dynamic> json) => New(
    id: json["_id"],
    user: json["user"],
    title: json["title"],
    summary: json["summary"],
    imgMain: json["imgMain"],
    html: json["html"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "title": title,
    "summary": summary,
    "imgMain": imgMain,
    "html": html,
  };
}
