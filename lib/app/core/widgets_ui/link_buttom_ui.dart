import 'package:flutter/material.dart';

class LinkButtomUi extends StatelessWidget {
  final VoidCallback callback;
  final Text textLink;

  const LinkButtomUi({
    super.key,
    required this.callback,
    required this.textLink,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size.zero, backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: callback,
      child: Container(
        // height: 20,
        decoration: const BoxDecoration(
            // color: Colors.blue,
            ),
        child: textLink,
      ),
    );
  }
}
