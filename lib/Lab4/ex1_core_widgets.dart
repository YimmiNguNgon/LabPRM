import 'package:flutter/material.dart';

class CoreWidgetsDemo extends StatelessWidget {
  const CoreWidgetsDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 1 – Core Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Icon(
              Icons.movie,
              size: 60,
              color: Colors.blue,
            ),

            const SizedBox(height: 12),
            Image.asset(
              'assets/images/anhthiennhien.jpg',
              height: 150,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 12),

            const Card(
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
