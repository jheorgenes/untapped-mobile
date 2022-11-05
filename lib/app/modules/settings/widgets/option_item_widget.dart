import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';

class OptionItemWidget extends StatelessWidget {
  final VoidCallback callback;
  final String title;
  final Color color;
  final Widget icon;
  const OptionItemWidget({
    Key? key,
    required this.callback,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ElevatedButtonUi(
        borderRadius: 6,
        backgroundColor: Colors.transparent,
        callback: callback,
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(6)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: icon,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const FaIcon(
                FontAwesomeIcons.angleRight,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
