import 'package:flutter/material.dart';

class ElevatedButtonUi extends StatelessWidget {
  final VoidCallback callback;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double? borderRadius;

  final Widget child;

  const ElevatedButtonUi({
    super.key,
    required this.callback,
    required this.child,
    this.backgroundColor,
    this.overlayColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            backgroundColor ?? Theme.of(context).primaryColor),
        elevation: MaterialStateProperty.all(0),
        overlayColor: MaterialStateProperty.all(overlayColor),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        // onPrimary: onPrimary,
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 40),
          ),
        ),
      ),
      onPressed: callback,
      child: child,
    );
  }
}
