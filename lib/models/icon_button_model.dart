import 'dart:convert';

class IconButtonModel {

  final String iconUrl;
  final String label;
  final String url;
  final bool isExternalUrl;

  IconButtonModel({
    required this.iconUrl,
    required this.label,
    required this.url,
    this.isExternalUrl = false,
  });

  factory IconButtonModel.fromJson(String str) => IconButtonModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory IconButtonModel.fromMap(Map<String, dynamic> map) => IconButtonModel(
    iconUrl: map["iconUrl"],
    label: map["label"],
    url: map["url"],
    isExternalUrl: map["isExternalUrl"] ?? false,
  );

  Map<String, dynamic> toMap() => {
    "iconUrl": iconUrl,
    "label": label,
    "url": url,
    "isExternalUrl": isExternalUrl,
  };

}
