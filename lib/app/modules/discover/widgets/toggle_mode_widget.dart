
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';

class ToggleModeWidget extends StatelessWidget {
  final bool isNow;
  final Function(bool isNow) toggleIsNow;

  const ToggleModeWidget({
    super.key,
    required this.isNow,
    required this.toggleIsNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 50,
      padding: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Color(0XFF32363D),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButtonUi(
            backgroundColor: isNow ? const Color(0XFFEF574E) : Colors.transparent,
            callback: () {
              toggleIsNow(true);
            }, 
            borderRadius: 30,
            child: SizedBox(
              width: 165,
              height: context.height,
              child: const Center(
                child: Text(
                  'Agora',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ),
          ElevatedButtonUi(
            backgroundColor: 
              !isNow ? const Color(0XFFEF574E) : Colors.transparent,
            callback: () {
              toggleIsNow(false);
            }, 
            borderRadius: 30,
            child: SizedBox(
              width: 122,
              height: context.height,
              child: const Center(
                child: Text(
                  'Agora',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}