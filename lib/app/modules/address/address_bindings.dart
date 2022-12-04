import 'package:get/get.dart';
import 'package:untapped/app/core/repository/address_repository.dart';
import '../../core/repository/via_cep_repository.dart';
import './address_controller.dart';

class AddressBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IViaCepRepository>(() => ViaCepRepository());

    Get.lazyPut<IAddressRepository>(() => AddresssRepository(Get.find()));
    Get.put(AddressController(
      Get.find(),
      Get.find(),
      Get.find(),
    ));
  }
}
