import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> { //Recebe um GetView do tipo HomeController para injetar informação na classe de visualização
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Untapped',
          style: TextStyle(
            fontFamily: 'Poppins', 
            fontWeight: FontWeight.w600
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Navigator(
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY), //Obtendo o a key do HomeController definida
        onGenerateRoute: controller.onGenerateRoute, //Obtendo a rota configurada
        initialRoute: '/events', //Definindo rota inicial /events
      ),
      bottomNavigationBar: Obx(() { //Definindo um botão do Getx
        return BottomNavigationBar( //Retorna uma barra de navegação (como a barra de ferramentas do windows)
          currentIndex: controller.activeIndex, //Obtém o index através da chamada do método activeIndex do controller
          onTap: (int index) {
            controller.activeIndex = index;
          },
          selectedItemColor: const Color(0XFFEF574E),
          items: const [
            BottomNavigationBarItem(
              label: 'Events',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.house,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Events',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.compass,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Events',
              backgroundColor: Color(0XFF181A20),
              icon: Icon(
                FontAwesomeIcons.bookmark,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Events',
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
