import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppBarUi extends StatelessWidget implements PreferredSizeWidget {
  const AppBarUi({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 95);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          ),
          const Spacer(),
          Icon(
            FontAwesomeIcons.magnifyingGlass,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            FontAwesomeIcons.bars,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(
            width: 15,
          ),
          Icon(
            FontAwesomeIcons.bell,
            size: 25,
            color: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
