import 'package:flutter/material.dart';

class TextFormFieldUi extends StatelessWidget {
  const TextFormFieldUi({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        hintText: 'Nome',
        hintStyle: const TextStyle(
          color: Color(0XFF6F7277),
          fontSize: 12,
        ),
        fillColor: const Color.fromRGBO(105, 109, 116, 0.3),
        filled: true,
        contentPadding: const EdgeInsets.all(5),
      ),
      strutStyle: const StrutStyle(),
    );
  }
}
