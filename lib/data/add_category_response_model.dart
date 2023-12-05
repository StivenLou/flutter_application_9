import 'package:meta/meta.dart';
import 'dart:convert';

class AddCategoryResponseModel {
  final String name;
  final String image;
  final int id;

  AddCategoryResponseModel({
    required this.name,
    required this.image,
    required this.id,
  });

  factory AddCategoryResponseModel.fromRawJson(String str) =>
      AddCategoryResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      AddCategoryResponseModel(
        name: json["name"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "id": id,
      };
}
