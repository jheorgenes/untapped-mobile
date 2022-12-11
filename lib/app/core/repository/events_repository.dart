import 'dart:convert';

import 'package:untapped/app/core/models/event_model.dart';

import '../rest_client/rest_client.dart';

abstract class IEventsRepositoty {
  Future<List<EventModel>> list();
  Future<EventModel> store(data);
  Future<EventModel> update(data, int id);
  Future<EventModel> show(id);
  Future<List<EventModel>> myEvents(int userId);
  Future<List<EventModel>> search(String title);
  Future delete(id);
}

class EventsRepository implements IEventsRepositoty {
  final RestClient _restClient;

  EventsRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<EventModel>> list() async {
    var response = await _restClient.get('/api/events');
    List<EventModel> result = [];
    response.body.forEach((item) {
      result.add(EventModel.fromMap(item));
    });

    return result;
  }

  @override
  Future<EventModel> show(id) async {
    var response = await _restClient.get('/api/events/$id');

    return EventModel.fromMap(response.body);
  }

  @override
  Future<List<EventModel>> myEvents(int userId) async {
    var response = await _restClient.get('/api/events/user/$userId');

    List<EventModel> result = [];
    response.body.forEach((item) {
      result.add(EventModel.fromMap(item));
    });

    return result;
  }

  @override
  Future<List<EventModel>> search(String title) async {
    var response = await _restClient.get('/api/events/search/$title');

    List<EventModel> result = [];
    response.body.forEach((item) {
      result.add(EventModel.fromMap(item));
    });

    return result;
  }

  @override
  Future delete(id) async {
    var response = await _restClient.delete('/api/events/$id');

    return response.body;
  }

  @override
  Future<EventModel> update(data, int id) async {
    try {
      var response = await _restClient.put('/api/events/$id', jsonEncode(data));

      return EventModel.fromMap(response.body);
    } catch (e) {
      throw Exception('Erro ao editar evento');
    }
  }

  @override
  Future<EventModel> store(data) async {
    try {
      var response = await _restClient.post('/api/events', jsonEncode(data));

      return EventModel.fromMap(response.body);
    } catch (e) {
      throw Exception('Erro ao salvar ticket');
    }
  }
}
