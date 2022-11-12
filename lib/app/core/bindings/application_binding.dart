import 'package:get/get.dart';

import '../rest_client/rest_client.dart';

class ApplicationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      RestClient(),

      //Não é destruido ao sair do state é mantido em todas a aplicação
      permanent: true,
    );
  }
}
