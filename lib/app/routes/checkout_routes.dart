import 'package:get/route_manager.dart';
import 'package:untapped/app/modules/checkout/checkout_bindings.dart';
import 'package:untapped/app/modules/checkout/checkout_page.dart';

class CheckoutRoutes {
  CheckoutRoutes._();

  static final routes = <GetPage>[
    GetPage(
      name: '/checkout',
      binding: CheckoutBindings(),
      page: () => const CheckoutPage(),
    )
  ];
}
