import 'dart:convert';

import 'package:untapped/app/core/rest_client/rest_client.dart';

abstract class IOrderRepository {
  list();
  ticketsOrders();
  Future create(Map<String, dynamic> data);
}

class OrderRepository implements IOrderRepository {
  final RestClient _restClient;

  OrderRepository(this._restClient);
  @override
  Future create(Map<String, dynamic> data) async {
    var response = await _restClient.post('/api/order', jsonEncode(data));

    if (response.statusCode == 500) {
      throw Exception('Erro no servidor');
    }

    return response.body;
  }

  @override
  ticketsOrders() async {
    var response = await _restClient.get('/api/ticketsOrder');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }

  @override
  list() async {
    var response = await _restClient.get('/api/order');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }
}
