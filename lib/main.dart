import 'package:flutter/material.dart';
import 'Lab1.dart';
import 'Lab4/lab4_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lab4MenuApp(),
    );
  }
}

