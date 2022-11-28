import 'package:get/route_manager.dart';
import 'package:untapped/app/modules/checkout/checkout_bindings.dart';
import 'package:untapped/app/modules/checkout/checkout_page.dart';
import 'package:untapped/app/modules/ticket/ticket_bindings.dart';
import 'package:untapped/app/modules/ticket/ticket_page.dart';

class CheckoutRoutes {
  CheckoutRoutes._();

  static final routes = <GetPage>[
    GetPage(
      name: '/checkout',
      binding: CheckoutBindings(),
      page: () => CheckoutPage(),
    ),
    GetPage(
      name: '/ticket',
      binding: TicketBindings(),
      page: () => const TicketPage(),
    ),
  ];
}
