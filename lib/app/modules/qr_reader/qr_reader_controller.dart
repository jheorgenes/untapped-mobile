import 'package:get/get.dart';

import '../../core/repository/order_repository.dart';

class QrReaderController extends GetxController {
  final IOrderRepository _orderRepository;

  QrReaderController(this._orderRepository);
  Future<bool> validateQrCode(String qrCode) async {
    var result = await _orderRepository.validateQrCode(qrCode);
    return result['id'] != null;
  }
}
