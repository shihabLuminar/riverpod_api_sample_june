// To parse this JSON data, do
//
//     final randomDataModel = randomDataModelFromJson(jsonString);

import 'dart:convert';

RandomDataModel randomDataModelFromJson(String str) =>
    RandomDataModel.fromJson(json.decode(str));

String randomDataModelToJson(RandomDataModel data) =>
    json.encode(data.toJson());

class RandomDataModel {
  String? number;
  String? language;
  String? insult;
  DateTime? created;
  String? shown;
  String? createdby;
  String? active;
  String? comment;

  RandomDataModel({
    this.number,
    this.language,
    this.insult,
    this.created,
    this.shown,
    this.createdby,
    this.active,
    this.comment,
  });

  factory RandomDataModel.fromJson(Map<String, dynamic> json) =>
      RandomDataModel(
        number: json["number"],
        language: json["language"],
        insult: json["insult"],
        created:
            json["created"] == null ? null : DateTime.parse(json["created"]),
        shown: json["shown"],
        createdby: json["createdby"],
        active: json["active"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "language": language,
        "insult": insult,
        "created": created?.toIso8601String(),
        "shown": shown,
        "createdby": createdby,
        "active": active,
        "comment": comment,
      };
}
