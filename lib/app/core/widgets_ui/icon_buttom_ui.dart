import 'package:flutter/material.dart';

class IconButtomUi extends StatelessWidget {
  final Text text;
  final Icon icon;
  final VoidCallback callback;
  final Color primaryColor;

  const IconButtomUi({
    super.key,
    required this.text,
    required this.icon,
    required this.callback,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
          foregroundColor: primaryColor, padding: const EdgeInsets.all(0), backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide.none,
        ),
        child: Column(
          children: [
            icon,
            text,
          ],
        ),
      ),
    );
  }
}
