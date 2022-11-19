import 'dart:async';

import 'package:get/get.dart';
import 'package:untapped/app/core/repository/order_repository.dart';
import 'package:untapped/app/core/services/auth_service.dart';

class CheckoutController extends GetxController {
  final AuthService authService;
  final IOrderRepository orderRepository;

  CheckoutController(this.authService, this.orderRepository);
  var loading = false.obs;

  Map<String, dynamic> data = {};

  Future submitedForm() async {
    final completer = Completer<void>();
    loading(true);
    Map<String, dynamic> result = {};

    try {
      result['message'] = 'Compra efetuada com sucesso!';
      result['status'] = 'success';
      result['data'] = await orderRepository.create(data);
    } catch (e) {
      result['message'] = 'Erro ao realizar compra, revise os dados.';
      result['status'] = 'error';
      result['data'] = null;
    }

    Timer(const Duration(milliseconds: 400), () {
      loading(false);
      completer.complete(result);
    });

    return completer.future;
  }
}
