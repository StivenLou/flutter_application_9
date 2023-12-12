import 'package:flutter/material.dart';
import 'package:flutter_application_9/data/add_category_request_model.dart';
import 'package:flutter_application_9/data/categories_model.dart';
import 'package:flutter_application_9/pages/home_page.dart';

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
            onPressed: () async {
              final model = AddCategoryRequestModel(
                name: namecontroller.text,
                image: imagecontroller.text,
              );
              final response =
                  await CategoryRemoteDatasource().addCategory(model);
              // ignore: use_build_context_synchronously
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              );
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
