import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/modules/checkout/widgets/card_confirm_widget.dart';
import 'package:untapped/app/core/widgets_ui/completed_order_bottom_sheet.dart';
import 'package:untapped/app/modules/checkout/widgets/form_payment_widget.dart';
import './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  CheckoutPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  _submitForm(context) {
    final formValid = _formKey.currentState?.validate() ?? false;

    if (formValid || true) {
      showMaterialModalBottomSheet(
        barrierColor: Colors.transparent,
        context: context,
        clipBehavior: Clip.none,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        builder: (context) => CompletedOrderBottomSheet(
          message: 'Compra efetuada com sucesso',
          iconAsset: 'assets/images/icon-success.png',
          subtitle:
              'Adele is a Scottish heiress whose extremely wealthy family owns estates and grounds. When she was a teenager. Read More',
          buttomCallback: () {
            Get.toNamed('/ticket');
          },
          titleButtom: 'Ver ingresso',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Checkout',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      floatingActionButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30))),
        ),
        onPressed: () => _submitForm(context),
        child: SizedBox(
          height: 35,
          width: context.widthTransformer(reducedBy: 20),
          child: const Center(
            child: Text(
              'Comprar',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25.0,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Forma de pagamento',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19),
                    ),
                    const Spacer(),
                    ElevatedButtonUi(
                      backgroundColor: Colors.transparent,
                      callback: () {},
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const CardConfirmWidget(),
                FormPaymentWidget(formKey: _formKey),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
