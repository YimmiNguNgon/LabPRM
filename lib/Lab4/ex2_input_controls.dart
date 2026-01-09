import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double rating = 50;
  bool isActive = false;
  String genre = 'None';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 – Input Controls')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Rating (Slider): ${rating.toInt()}'),
            Slider(
              value: rating,
              min: 0,
              max: 100,
              onChanged: (value) => setState(() => rating = value),
            ),
            SwitchListTile(
              title: const Text('Is movie active?'),
              value: isActive,
              onChanged: (value) => setState(() => isActive = value),
            ),
            const Text('Genre'),
            RadioListTile(
              title: const Text('Action'),
              value: 'Action',
              groupValue: genre,
              onChanged: (value) => setState(() => genre = value!),
            ),
            RadioListTile(
              title: const Text('Comedy'),
              value: 'Comedy',
              groupValue: genre,
              onChanged: (value) => setState(() => genre = value!),
            ),
            Text('Selected genre: $genre'),
            ElevatedButton(
              child: const Text('Open Date Picker'),
              onPressed: () async {
                await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2030),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
