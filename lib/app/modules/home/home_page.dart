import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  //Recebe um GetView do tipo HomeController para injetar informação na classe de visualização
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(
            controller.title.value,
            style: const TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w600),
          );
        }),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Navigator(
        key: Get.nestedKey(HomeController
            .NAVIGATOR_KEY), //Obtendo o a key do HomeController definida
        onGenerateRoute:
            controller.onGenerateRoute, //Obtendo a rota configurada
        initialRoute: '/events', //Definindo rota inicial /events
      ),
      bottomNavigationBar: Obx(() {
        //Definindo um botão do Getx
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,

          backgroundColor: Theme.of(context).backgroundColor,

          selectedItemColor: const Color(0xFFFFEA74),

          unselectedItemColor: const Color(0XFFFFFAFA),
          // unselectedItemColor: Colors.white,
          // sele
          enableFeedback: false,
          //Retorna uma barra de navegação (como a barra de ferramentas do windows)
          currentIndex: controller
              .activeIndex, //Obtém o index através da chamada do método activeIndex do controller
          onTap: (int index) {
            controller.activeIndex = index;
          },
          items: const [
            BottomNavigationBarItem(
              tooltip: '',
              label: 'Events',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.house,
              ),
            ),
            // if (controller.authService.user['roles'] != null &&
            //     controller.isShow(controller.authService.user['roles']))
            //   const BottomNavigationBarItem(
            //     label: 'Dasboard',
            //     tooltip: '',
            //     backgroundColor: Color(0XFF181A20),
            //     icon: Icon(
            //       FontAwesomeIcons.gauge,
            //     ),
            //   ),
            BottomNavigationBarItem(
              label: 'Discover',
              tooltip: '',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.compass,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Tickets',
              tooltip: '',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.bookmark,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Profile',
              tooltip: '',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.user,
              ),
            ),
          ],
        );
      }),
    );
  }
}
