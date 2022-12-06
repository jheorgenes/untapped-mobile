import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';

import '../../../core/constants/constants.dart';

class AvatarWidget extends StatelessWidget {
  final String? avatar;
  final String? fullName;
  const AvatarWidget({super.key, this.avatar, this.fullName});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        children: [
          ElevatedButtonUi(
            backgroundColor: Colors.transparent,
            callback: () {
              Get.toNamed('/profile');
            },
            child: Row(
              children: [
                SizedBox(
                  width: 48,
                  height: 48,
                  child: avatar != null
                      ? Image.network(Constants.IMAGES_URL + avatar!)
                      : const Center(
                          child: FaIcon(
                            FontAwesomeIcons.user,
                          ),
                        ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  fullName ?? '',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
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
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
