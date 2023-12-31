import 'package:flutter/material.dart';
import 'package:flutter_application_9/data/categories_model.dart';
import 'package:flutter_application_9/pages/edit_category_page.dart';
import 'package:flutter_application_9/pages/home_page.dart';

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
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirmation'),
                      content:
                          const Text('Are you sure want to delete this task?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No')),
                        TextButton(
                            onPressed: () async {
                              await CategoryRemoteDatasource()
                                  .deleteCategory(widget.category.id);
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return const HomePage();
                              }));
                            },
                            child: const Text('Yes')),
                      ],
                    );
                  });
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
