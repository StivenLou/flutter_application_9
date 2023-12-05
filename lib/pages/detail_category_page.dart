import 'package:flutter/material.dart';
import 'package:flutter_application_9/data/categories_model.dart';
import 'package:flutter_application_9/pages/edit_category_page.dart';

class DetailCategoryPage extends StatefulWidget {
  final CategoriesModel category;
  const DetailCategoryPage({super.key, required this.category});

  @override
  State<DetailCategoryPage> createState() => _DetailCategoryPageState();
}

class _DetailCategoryPageState extends State<DetailCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Task',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          Text('Name: ${widget.category.name}'),
          const SizedBox(height: 16),
          Text('Image: ${widget.category.image}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditCategoryPage(
                  category: widget.category,
                );
              }));
            },
            child: const Text('Edit'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
