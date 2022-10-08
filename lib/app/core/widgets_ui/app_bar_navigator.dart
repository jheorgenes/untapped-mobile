import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarNavigator extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showIcon;
  final Color color;

  const AppBarNavigator({
    super.key,
    required this.title,
    required this.showIcon,
    required this.color,
  });

  @override
  Size get preferredSize => const Size(double.infinity, 95);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: const EdgeInsets.symmetric(
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
            child: const FaIcon(FontAwesomeIcons.chevronLeft),
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
        ],
      ),
    );
  }
}
