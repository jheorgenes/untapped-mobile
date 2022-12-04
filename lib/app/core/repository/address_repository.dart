import 'dart:convert';

import 'package:untapped/app/core/rest_client/rest_client.dart';

abstract class IAddressRepository {
  Future create(Map<String, dynamic> data);
  Future update(Map<String, dynamic> data, int id);
}

class AddresssRepository implements IAddressRepository {
  final RestClient _restClient;

  AddresssRepository(this._restClient);
  @override
  Future create(Map<String, dynamic> data) async {
    var response = await _restClient.post('/api/address', jsonEncode(data));

    return response.body;
  }

  @override
  Future update(Map<String, dynamic> data, int id) async {
    var response = await _restClient.put('/api/address/$id', jsonEncode(data));

    return response.body;
  }
}
