import 'package:flutter/material.dart';

class DropdownButtonUi extends StatelessWidget {
  const DropdownButtonUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text('Idioma:'),
        const SizedBox(width: 10),
        DropdownButton<String>(
          value: 'Português',
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          onChanged: (_) => {},
          items: <String>['Português', 'Hebreu']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}
