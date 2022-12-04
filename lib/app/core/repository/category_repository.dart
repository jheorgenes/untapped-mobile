import 'dart:convert';

import '../rest_client/rest_client.dart';

abstract class ICategoryRepositoty {
  Future list();
  Future store(data);
  Future show(id);
}

class CategoryRepository implements ICategoryRepositoty {
  final RestClient _restClient;

  CategoryRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future list() async {
    var response = await _restClient.get('/api/categories');
    return response.body;
  }

  @override
  Future show(id) async {
    var response = await _restClient.get('/api/categories/$id');

    return response.body;
  }

  @override
  Future store(data) async {
    try {
      var response =
          await _restClient.post('/api/categories', jsonEncode(data));

      return response.body;
    } catch (e) {
      throw Exception('Erro ao salvar ticket');
    }
  }
}
