import 'package:get/get.dart';

import '../../core/repository/events_repository.dart';

class TicketController extends GetxController {
  final IEventsRepositoty _eventsRepositoty;

  TicketController(this._eventsRepositoty);
  String messageHelp =
      'Apresente esse ticktet na entrada do evento ao responsável pelo check-in. ';

  loadEvent(int eventId) {
    return _eventsRepositoty.show(eventId);
  }
}
