import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_9/data/categories_model.dart';
import 'package:flutter_application_9/pages/add_category_page.dart';
import 'package:flutter_application_9/pages/detail_category_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<CategoriesModel> categories = [];

  Future<void> getCategories() async {
    setState(() {
      isLoading = true;
    });

    final List<CategoriesModel> model =
        await CategoryRemoteDatasource().getCategories();
    setState(() {
      categories = model;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP Sesi 9'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              itemBuilder: ((context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return DetailCategoryPage(category: category);
                      },
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(category.name),
                      subtitle: Image.network(
                        category.image,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
              itemCount: categories.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const AddCategoryPage();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
