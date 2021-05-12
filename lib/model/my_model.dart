// To parse this JSON data, do
//
//     final myModel = myModelFromJson(jsonString);

import 'dart:convert';

List<MyModel> myModelFromJson(String str) => List<MyModel>.from(json.decode(str).map((x) => MyModel.fromJson(x)));

String myModelToJson(List<MyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyModel {
  MyModel({
    this.id,
    this.type,
    this.url,
    this.createdAt,
    this.company,
    this.companyUrl,
    this.location,
    this.title,
    this.description,
    this.howToApply,
    this.companyLogo,
  });

  String id;
  Type type;
  String url;
  String createdAt;
  String company;
  String companyUrl;
  String location;
  String title;
  String description;
  String howToApply;
  String companyLogo;

  factory MyModel.fromJson(Map<String, dynamic> json) => MyModel(
    id: json["id"],
    type: typeValues.map[json["type"]],
    url: json["url"],
    createdAt: json["created_at"],
    company: json["company"],
    companyUrl: json["company_url"] == null ? null : json["company_url"],
    location: json["location"],
    title: json["title"],
    description: json["description"],
    howToApply: json["how_to_apply"],
    companyLogo: json["company_logo"] == null ? null : json["company_logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": typeValues.reverse[type],
    "url": url,
    "created_at": createdAt,
    "company": company,
    "company_url": companyUrl == null ? null : companyUrl,
    "location": location,
    "title": title,
    "description": description,
    "how_to_apply": howToApply,
    "company_logo": companyLogo == null ? null : companyLogo,
  };
}

enum Type { FULL_TIME, CONTRACT }

final typeValues = EnumValues({
  "Contract": Type.CONTRACT,
  "Full Time": Type.FULL_TIME
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
