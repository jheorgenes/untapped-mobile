import 'package:flutter/material.dart';

class RountedButtomUi extends StatelessWidget {
  final Widget child;
  final Color? primaryColor;
  final VoidCallback callback;

  const RountedButtomUi({
    super.key,
    required this.child,
    this.primaryColor,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
            primaryColor ?? Theme.of(context).primaryColor),
        elevation: MaterialStateProperty.all(0),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        shape: MaterialStateProperty.all(const CircleBorder()),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(const Size(0, 0)),
      ),
      onPressed: callback,
      child: child,
    );
  }
}
