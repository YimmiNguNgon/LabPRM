import 'package:flutter/material.dart';

class UIFixesDemo extends StatelessWidget {
  const UIFixesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5 – Common UI Fixes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Mô tả bài học
            const Text(
              'Correct ListView inside Column using Expanded',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('Movie A'),
                  ),
                  ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('Movie B'),
                  ),
                  ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('Movie C'),
                  ),
                  ListTile(
                    leading: Icon(Icons.movie),
                    title: Text('Movie D'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}