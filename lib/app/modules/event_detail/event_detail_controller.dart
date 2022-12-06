import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';

class EventDetailController extends GetxController {
  final IEventsRepositoty _eventsRepositoty;
  EventDetailController(this._eventsRepositoty);
  deleteEvent(int id) async {
    var result = await _eventsRepositoty.delete(id);

    return result;
  }
}
