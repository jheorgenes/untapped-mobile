import 'package:get/get.dart';

import '../../core/repository/events_repository.dart';
import '../../core/services/auth_service.dart';

class ManagerEventsController extends GetxController {
  final IEventsRepositoty _eventsRepositoty;
  final AuthService authService;

  ManagerEventsController(this._eventsRepositoty, this.authService);

  loadMyEvents() async {
    var userId = authService.user['id'];
    return await _eventsRepositoty.myEvents(userId);
  }
}
