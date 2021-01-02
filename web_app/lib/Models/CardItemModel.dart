// To parse this JSON data, do
//
//     final cardItemModel = cardItemModelFromJson(jsonString);

import 'dart:convert';

CardItemModel cardItemModelFromJson(String str) => CardItemModel.fromJson(json.decode(str));

String cardItemModelToJson(CardItemModel data) => json.encode(data.toJson());

class CardItemModel {
  CardItemModel({
    this.contents,
    this.createdBy,
    this.createdAt,
    this.backgroundIdx
  });

  String contents;
  String createdBy;
  String createdAt;
  int backgroundIdx;

  factory CardItemModel.fromJson(Map<String, dynamic> json) => CardItemModel(
      contents: json["contents"],
      createdBy: json["createdBy"],
      createdAt: json["createdAt"],
      backgroundIdx: json["backgroundIdx"]
  );

  Map<String, dynamic> toJson() => {
    "contents": contents,
    "createdBy": createdBy,
    "createdAt": createdAt,
    "backgroundIdx": backgroundIdx
  };
}
