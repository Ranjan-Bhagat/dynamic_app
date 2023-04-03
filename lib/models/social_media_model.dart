import 'dart:convert';
import 'icon_button_model.dart';

class SocialMediaModel {

  SocialMediaModel({
    this.title,
    this.socialMedia = const [],
  });

  final String? title;
  final List<IconButtonModel> socialMedia;

  factory SocialMediaModel.fromJson(String str) => SocialMediaModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SocialMediaModel.fromMap(Map<String, dynamic> map) => SocialMediaModel(
    title: map["title"],
    socialMedia: List<IconButtonModel>.from(map["socialMedia"].map((x) => IconButtonModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "socialMedia": List<dynamic>.from(socialMedia.map((x) => x.toMap())),
  };
}
