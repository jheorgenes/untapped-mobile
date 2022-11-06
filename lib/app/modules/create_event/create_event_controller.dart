import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';

class CreateEventController extends GetxController {
  final IEventsRepositoty _eventsRepositoty;

  CreateEventController(this._eventsRepositoty);
  submitedForm(Map<String, dynamic> data) async {
    var result = await _eventsRepositoty.store(data);
  }
}
