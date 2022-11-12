import 'dart:convert';

import 'package:untapped/app/core/rest_client/rest_client.dart';

abstract class IAuthRepository {
  Future login(Map<String, dynamic> data);
  Future me();
}

class AuthRepository implements IAuthRepository {
  final RestClient _restClient;

  AuthRepository(this._restClient);
  @override
  Future login(Map<String, dynamic> data) async {
    var response = await _restClient.post('/auth/signin', jsonEncode(data));

    return response.body;
  }

  @override
  Future me() async {
    var response = await _restClient.get('/auth/signin/me');
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(response.body);
    }
  }
}
