import 'package:get/get.dart';
import 'package:untapped/app/core/repository/order_repository.dart';
import './qr_reader_controller.dart';

class QrReaderBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IOrderRepository>(
      () => OrderRepository(
        Get.find(),
      ),
    );
    Get.put(QrReaderController(Get.find()));
  }
}
