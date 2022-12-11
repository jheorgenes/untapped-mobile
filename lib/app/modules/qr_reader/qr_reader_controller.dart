import 'dart:async';

import 'package:get/get.dart';

import '../../core/repository/order_repository.dart';

class QrReaderController extends GetxController {
  final IOrderRepository _orderRepository;

  QrReaderController(this._orderRepository);
  Future validateQrCode(String qrCode) async {
    final completer = Completer<void>();

    var result = await _orderRepository.validateQrCode(qrCode);

    Timer(const Duration(milliseconds: 1000), () {
      completer.complete(result['id'] != null);
    });

    return completer.future;
  }
}
