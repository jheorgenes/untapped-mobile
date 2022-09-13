import 'package:flutter/material.dart';

class SwitchUi extends StatelessWidget {
  final String label;
  final bool isSwitched;
  final Function(bool) voidCallback;

  const SwitchUi({
    super.key,
    required this.label,
    required this.isSwitched,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(label),
          Switch(
            value: isSwitched,
            onChanged: voidCallback,
          )
        ],
      ),
    );
  }
}
