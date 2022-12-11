import 'package:flutter/material.dart';

class TextFormFieldUi extends StatefulWidget {
  final String title;
  final FocusNode? focusNode;
  final Function(String? value) onChanged;
  const TextFormFieldUi(
      {super.key,
      required this.title,
      required this.onChanged,
      this.focusNode});

  @override
  State<TextFormFieldUi> createState() => _TextFormFieldUiState();
}

class _TextFormFieldUiState extends State<TextFormFieldUi> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
        ),
        hintText: widget.title,
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
          width: 1,
          color: Colors.white30,
        )),
        hintStyle: const TextStyle(
          color: Color(0XFF6F7277),
          fontSize: 12,
        ),
        fillColor: const Color.fromRGBO(105, 109, 116, 0.3),
        filled: true,
        contentPadding: const EdgeInsets.all(10),
      ),
      strutStyle: const StrutStyle(),
      onChanged: widget.onChanged,
    );
  }
}
