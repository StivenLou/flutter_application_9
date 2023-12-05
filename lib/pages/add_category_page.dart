import 'package:flutter/material.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final namecontroller = TextEditingController();
  final imagecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Task',
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
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
