import 'dart:convert';

import 'package:http/http.dart' as http;

class CategoriesModel {
  final int id;
  final String name;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  CategoriesModel({
    required this.id,
    required this.name,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory CategoriesModel.fromRawJson(String str) =>
      CategoriesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      CategoriesModel(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
      };
}

class CategoryRemoteDatasource {
  Future<List<CategoriesModel>> getCategories() async {
    final response = await http.get(
      Uri.parse('https://api.escuelajs.co/api/v1/categories'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);

      final List<CategoriesModel> categories = jsonResponse
          .map((categoryJson) => CategoriesModel.fromJson(categoryJson))
          .toList();

      return categories;
    } else {
      throw Exception('Failed to load data');
    }
  }
}