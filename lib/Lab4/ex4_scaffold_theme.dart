import 'package:flutter/material.dart';

class ScaffoldThemeDemo extends StatefulWidget {
  const ScaffoldThemeDemo({super.key});

  @override
  State<ScaffoldThemeDemo> createState() => _ScaffoldThemeDemoState();
}

class _ScaffoldThemeDemoState extends State<ScaffoldThemeDemo> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 4 – App Structure & Theme'),
        ),
        body: Builder(
          builder: (context) {
            return Center(
              child: Text(
                'This is a simple screen with theme toggle.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              isDark = !isDark;
            });
          },
          child: const Icon(Icons.brightness_6),
        ),
      ),
    );
  }
}
