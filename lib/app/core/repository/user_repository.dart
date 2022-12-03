import 'dart:convert';

import 'package:untapped/app/core/rest_client/rest_client.dart';

abstract class IUserRepository {
  Future create(Map<String, dynamic> data);
  Future update(Map<String, dynamic> data);
}

class UserRepository implements IUserRepository {
  final RestClient _restClient;

  UserRepository(this._restClient);
  @override
  Future create(Map<String, dynamic> data) async {
    var response = await _restClient.post('/api/users', jsonEncode(data));

    return response.body;
  }

  @override
  Future update(Map<String, dynamic> data) async {
    var response = await _restClient.put('/api/users', jsonEncode(data));

    return response.body;
  }
}
