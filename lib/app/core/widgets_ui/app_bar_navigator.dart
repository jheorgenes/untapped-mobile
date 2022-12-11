import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarNavigator extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showIcon;
  final Color color;
  final Color? backIconColor;
  final Widget? customRightWidget;

  const AppBarNavigator({
    super.key,
    required this.title,
    required this.showIcon,
    required this.color,
    this.backIconColor,
    this.customRightWidget,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 95);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              minimumSize: Size.zero, // Set this
              padding: const EdgeInsets.all(10),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: const CircleBorder(),
            ),
            child: FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: backIconColor,
            ),
          ),
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
          const Spacer(),
          if (showIcon)
            const FaIcon(
              FontAwesomeIcons.bookmark,
              color: Colors.white,
            ),
          if (customRightWidget != null) customRightWidget!
        ],
      ),
    );
  }
}
