import 'package:get/route_manager.dart';
import 'package:untapped/app/modules/event_detail/event_detail_bindings.dart';
import 'package:untapped/app/modules/event_detail/event_detail_page.dart';

class EventDetailRoutes {
  EventDetailRoutes._();

  static final routes = <GetPage>[
    GetPage(
      name: '/events/detail',
      binding: EventDetailBindings(),
      page: () => const EventDetailPage(),
    )
  ];
}
