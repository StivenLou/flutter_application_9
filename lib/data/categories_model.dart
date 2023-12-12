import 'dart:convert';

import 'package:flutter_application_9/data/add_category_request_model.dart';
import 'package:flutter_application_9/data/add_category_response_model.dart';
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
  Future<AddCategoryResponseModel> updateCategories(
      int id, AddCategoryRequestModel data) async {
    final response = await http.put(
      Uri.parse('https://api.escuelajs.co/api/v1/categories/$id'),
      body: data.toJson(),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddCategoryResponseModel.fromJson(response.body);
    } else {
      throw Exception('Failed to update category');
    }
  }

  Future<AddCategoryResponseModel> addCategory(
      AddCategoryRequestModel data) async {
    final response = await http.post(
      Uri.parse('https://api.escuelajs.co/api/v1/categories/'),
      body: data.toJson(),
      headers: {
        'Content-type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return AddCategoryResponseModel.fromJson(response.body);
    } else {
      throw Exception('Field to add Category');
    }
  }

  Future<bool> deleteCategory(int id) async {
    final response = await http.delete(
      Uri.parse('https://api.escuelajs.co/api/v1/categories/$id'),
    );
    if (response.statusCode == 200) {
      return response.body.toLowerCase() == 'true';
    } else {
      throw Exception('Failed to delete category');
    }
  }

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
