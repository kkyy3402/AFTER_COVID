// To parse this JSON data, do
//
//     final cardItemModel = cardItemModelFromJson(jsonString);

import 'dart:convert';

CardItemModel cardItemModelFromJson(String str) => CardItemModel.fromJson(json.decode(str));

String cardItemModelToJson(CardItemModel data) => json.encode(data.toJson());

class CardItemModel {
  CardItemModel({
    this.content,
    this.createdBy,
    this.createdAt,
  });

  String content;
  String createdBy;
  String createdAt;

  factory CardItemModel.fromJson(Map<String, dynamic> json) => CardItemModel(
    content: json["content"],
    createdBy: json["createdBy"],
    createdAt: json["createdAt"],
  );

  Map<String, dynamic> toJson() => {
    "content": content,
    "createdBy": createdBy,
    "createdAt": createdAt,
  };
}
