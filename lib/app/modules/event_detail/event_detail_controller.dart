import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';
import 'package:untapped/app/core/services/auth_service.dart';

class EventDetailController extends GetxController {
  final IEventsRepositoty _eventsRepositoty;
  final AuthService authService;
  EventDetailController(
    this._eventsRepositoty,
    this.authService,
  );
  deleteEvent(int id) async {
    var result = await _eventsRepositoty.delete(id);

    return result;
  }
}
