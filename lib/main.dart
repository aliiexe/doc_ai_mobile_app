import 'package:flutter/material.dart';
import 'package:doc_app/pages/Auth.dart'; // Ensure correct import
import 'package:doc_app/pages/LayoutPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DocAI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Initially show Auth page, replace it with LayoutPage after successful login
      home: const Auth(),
    );
  }
}
