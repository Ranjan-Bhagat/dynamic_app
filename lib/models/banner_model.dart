import 'dart:convert';

class BannerModel {

  final String imageUrl;
  final String url;
  final bool isExternalUrl;

  BannerModel({
    required this.imageUrl,
    required this.url,
    this.isExternalUrl = false,
  });

  factory BannerModel.fromJson(String str) => BannerModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory BannerModel.fromMap(Map<String, dynamic> map) => BannerModel(
    imageUrl: map["imageUrl"],
    url: map["url"],
    isExternalUrl: map["isExternalUrl"] ?? false,
  );

  Map<String, dynamic> toMap() => {
    "imageUrl": imageUrl,
    "url": url,
    "isExternalUrl": isExternalUrl,
  };

}
