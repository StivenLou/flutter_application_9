import 'package:meta/meta.dart';
import 'dart:convert';

class AddCategoryRequestModel {
  final String name;
  final String image;

  AddCategoryRequestModel({
    required this.name,
    required this.image,
  });

  factory AddCategoryRequestModel.fromRawJson(String str) =>
      AddCategoryRequestModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCategoryRequestModel.fromJson(Map<String, dynamic> json) =>
      AddCategoryRequestModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
      };
}
