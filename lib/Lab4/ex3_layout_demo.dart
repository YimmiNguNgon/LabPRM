import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  final movies = const [
    'Avatar',
    'Inception',
    'Interstellar',
    'Joker'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 3 – Layout Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text('Now Playing',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, i) => Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text(movies[i][0])),
                    title: Text(movies[i]),
                    subtitle: const Text('Sample description'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
