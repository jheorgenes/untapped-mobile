import 'package:untapped/app/core/models/address_model.dart';
import 'package:untapped/app/core/models/event_model.dart';

import '../rest_client/rest_client.dart';

abstract class IEventsRepositoty {
  Future<List<EventModel>> list();
  Future<AddressModel> show(id);
}

class EventsRepository implements IEventsRepositoty {
  final RestClient _restClient;

  EventsRepository({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<EventModel>> list() async {
    var response = await _restClient.get('/events');
    List<EventModel> result = [];
    response.body.forEach((item) {
      result.add(EventModel.fromMap(item));
    });

    return result;
  }

  @override
  Future<AddressModel> show(id) {
    // TODO: implement show
    throw UnimplementedError();
  }
}
