import 'package:flutter/material.dart';
import 'package:flutter_application_9/data/categories_model.dart';

class EditCategoryPage extends StatefulWidget {
  final CategoriesModel category;
  const EditCategoryPage({super.key, required this.category});

  @override
  State<EditCategoryPage> createState() => _EditCategoryPageState();
}

class _EditCategoryPageState extends State<EditCategoryPage> {
  final namecontroller = TextEditingController();
  final imagecontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    namecontroller.text = widget.category.name;
    imagecontroller.text = widget.category.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Task',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 2,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        children: [
          TextField(
            controller: namecontroller,
            decoration: const InputDecoration(
              hintText: 'Category Name',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: imagecontroller,
            decoration: const InputDecoration(
              hintText: 'Image Url',
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }
}
