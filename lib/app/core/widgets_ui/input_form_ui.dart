import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputFormUi extends StatefulWidget {
  final String label;
  final String type;

  const InputFormUi({
    super.key,
    required this.label,
    required this.type,
  });

  @override
  State<InputFormUi> createState() => _InputFormUiState();
}

class _InputFormUiState extends State<InputFormUi> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        TextFormField(
          obscureText: _obscure && widget.type == 'password',
          decoration: InputDecoration(
            labelText: widget.label,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 1, color: Color(0XFFE0E0E0)),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        if (widget.type == 'password')
          InkWell(
            onTap: () {
              setState(() {
                _obscure = !_obscure;
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: FaIcon(
                  _obscure ? FontAwesomeIcons.solidEye : FontAwesomeIcons.eye),
            ),
          ),
      ],
    );
  }
}
