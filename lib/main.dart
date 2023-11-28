import 'package:flutter/material.dart';
import 'package:flutter_application_9/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Sesi 9',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("APP Sesi 9"),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: HomePage(),
      ),
    );
  }
}
