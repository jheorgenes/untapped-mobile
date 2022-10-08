import 'package:get/get.dart';

import '../rest_client/rest_client.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RestClient(),
      //Não é destruido ao sair do state é mantido em todas a aplicação
      fenix: true,
    );
  }
}
