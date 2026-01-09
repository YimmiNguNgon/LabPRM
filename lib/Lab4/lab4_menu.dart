import 'package:flutter/material.dart';
import 'ex1_core_widgets.dart';
import 'ex2_input_controls.dart';
import 'ex3_layout_demo.dart';
import 'ex4_scaffold_theme.dart';
import 'ex5_ui_fixes.dart';

class Lab4MenuApp extends StatelessWidget {
  const Lab4MenuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Lab 4 – Flutter UI Fundamentals')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _item(context, 'Exercise 1 – Core Widgets', const CoreWidgetsDemo()),
            _item(context, 'Exercise 2 – Input Controls', const InputControlsDemo()),
            _item(context, 'Exercise 3 – Layout Demo', const LayoutDemo()),
            _item(context, 'Exercise 4 – App Structure & Theme', const ScaffoldThemeDemo()),
            _item(context, 'Exercise 5 – Common UI Fixes', const UIFixesDemo()),
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, String title, Widget page) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        ),
      ),
    );
  }
}
