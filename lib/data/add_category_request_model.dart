import 'package:meta/meta.dart';
import 'dart:convert';

class AddCategoryRequestModel {
  final String name;
  final String image;

  AddCategoryRequestModel({
    required this.name,
    required this.image,
  });

  factory AddCategoryRequestModel.fromJson(String str) =>
      AddCategoryRequestModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddCategoryRequestModel.fromMap(Map<String, dynamic> json) =>
      AddCategoryRequestModel(
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
      };
}
