import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/modules/settings/widgets/avatar_widget.dart';
import 'package:untapped/app/modules/settings/widgets/option_item_widget.dart';
import './settings_controller.dart';

class SettingsPage extends GetView<SettingsController> {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AvatarWidget(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            OptionItemWidget(
              title: 'Meus eventos',
              callback: () {
                Get.toNamed('/manager_events');
              },
              color: const Color(0XFF546EE5),
              icon: const FaIcon(FontAwesomeIcons.calendar),
            ),
            OptionItemWidget(
              title: 'E-mail e pagamento',
              callback: () {},
              color: const Color(0XFF54C2E5),
              icon: const FaIcon(FontAwesomeIcons.message),
            ),
            OptionItemWidget(
              title: ' Leitor de códigos',
              color: const Color(0XFF00CB97),
              callback: () {},
              icon: const FaIcon(FontAwesomeIcons.squarePlus),
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Account',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            OptionItemWidget(
              title: ' Cadastrar eventos',
              callback: () {
                Get.toNamed('/events/create');
              },
              color: const Color(0XFF546EE5),
              icon: const FaIcon(FontAwesomeIcons.gear),
            ),
            const SizedBox(
              height: 16,
            ),
            OptionItemWidget(
              title: ' Criar categoria',
              callback: () {
                Get.toNamed('/category/create');
              },
              color: const Color(0XFF546EE5),
              icon: const FaIcon(FontAwesomeIcons.gear),
            ),
            const SizedBox(
              height: 16,
            ),
            OptionItemWidget(
              title: ' Endereço',
              callback: () {
                Get.toNamed('/user/address');
              },
              color: const Color(0XFF546EE5),
              icon: const FaIcon(FontAwesomeIcons.locationArrow),
            ),
            const SizedBox(
              height: 16,
            ),
            const Divider(
              color: Colors.white,
            ),
            const Text(
              'Privacy & Policy',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OptionItemWidget(
              title: ' Notificações',
              callback: () {},
              color: const Color(0XFF546EE5),
              icon: const FaIcon(FontAwesomeIcons.bell),
            ),
            OptionItemWidget(
              title: ' Meus tickets',
              callback: () {},
              color: const Color(0XFF54C2E5),
              icon: const FaIcon(FontAwesomeIcons.ticket),
            ),
            OptionItemWidget(
              title: ' Sair',
              callback: controller.logout,
              color: const Color(0XFFE55454),
              icon: const FaIcon(FontAwesomeIcons.arrowRightFromBracket),
            ),
          ],
        ),
      ),
    );
  }
}
