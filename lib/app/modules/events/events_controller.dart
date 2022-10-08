import 'package:get/get.dart';
import 'package:untapped/app/core/repository/events_repository.dart';

class EventsController extends GetxController {
  final IEventsRepositoty _eventsRepository;
  final _events = [].obs;

  List get events => _events.value;

  EventsController({
    required IEventsRepositoty eventsRepository,
  }) : _eventsRepository = eventsRepository;

  Future loadEvents() async {
    var response = await _eventsRepository.list();

    _events.value = response;
  }
}
