import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BottomSheetUi extends StatelessWidget {
  final Widget child;
  // final VoidCallback buttomClose;

  const BottomSheetUi({
    super.key,
    required this.child,
    // required this.buttomClose,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10.0,
          left: 10,
          right: 10,
        ),
        child: Container(
          width: context.width,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                width: context.width,
                height: 36,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 18,
                      child: Container(
                        width: 20,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 10,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: const BoxDecoration(),
                          child: Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
