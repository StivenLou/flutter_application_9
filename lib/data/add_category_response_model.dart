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

  factory AddCategoryResponseModel.fromJson(String str) =>
      AddCategoryResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AddCategoryResponseModel.fromMap(Map<String, dynamic> json) =>
      AddCategoryResponseModel(
        name: json["name"],
        image: json["image"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "image": image,
        "id": id,
      };
}
