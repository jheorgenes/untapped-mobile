import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:untapped/app/core/models/ticket_model.dart';
import 'package:untapped/app/core/widgets_ui/app_bar_navigator.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';
import 'package:untapped/app/modules/checkout/widgets/card_confirm_widget.dart';
import 'package:untapped/app/core/widgets_ui/completed_order_bottom_sheet.dart';
import 'package:untapped/app/modules/checkout/widgets/form_payment_widget.dart';
import './checkout_controller.dart';

class CheckoutPage extends GetView<CheckoutController> {
  CheckoutPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _dateValidController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  List? ticketOrders;

  _submitForm(context) {
    final formValid = _formKey.currentState?.validate() ?? false;
    final eventId = ticketOrders?[0]['ticket'].eventID;
    final userId = controller.authService.user['id'];
    final date = DateFormat('dd/MM/yyyy HH:ss').format(DateTime.now());

    if (formValid || true) {
      controller.data = {
        // 'payments': {
        //   'email': _emailController.text,
        //   'name': _nameController.text,
        //   'card_number': _cardNumberController.text,
        //   'cvv': _cvvController.text,
        // },
        'date': date,
        'userId': userId,
        'eventId': eventId,
        'ticketsOrder': _getTicketsOrders(),
      };

      controller.submitedForm().then((value) {
        _successPayment(context, value);
      });
    }
  }

  _getTicketsOrders() {
    var ticketsOrders = [];

    ticketOrders?.forEach((element) {
      var ticket = element['ticket'] as TicketModel;
      var quantity = element['quantity'];
      ticketsOrders.add({
        'ticket': ticket.toMap(),
        'price': ticket.valueTicket,
        'quantity': quantity,
      });
    });

    return ticketsOrders;
  }

  _successPayment(BuildContext context, Map<String, dynamic> result) {
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
        message: result['message'],
        icon: result['status'] == 'success'
            ? Image.asset(
                'assets/images/icon-success.png',
              )
            : const FaIcon(
                FontAwesomeIcons.circleExclamation,
                color: Colors.red,
                size: 70,
              ),
        subtitle: '',
        buttomCallback: () {
          if (result['status'] == 'success') {
            Get.toNamed('/ticket', arguments: result);
          } else {
            Navigator.of(context).pop();
          }
        },
        titleButtom:
            result['status'] == 'success' ? 'Ver ingresso' : 'Tentar novamente',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final params = ModalRoute.of(context)!.settings.arguments as List;
    ticketOrders = params;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Checkout',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      floatingActionButton: Obx(() {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30))),
          ),
          onPressed: () => _submitForm(context),
          child: SizedBox(
            height: 35,
            width: context.widthTransformer(reducedBy: 20),
            child: Center(
              child: !controller.loading.value
                  ? const Text(
                      'Comprar',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    )
                  : const CircularProgressIndicator(
                      color: Colors.white,
                    ),
            ),
          ),
        );
      }),
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
                FormPaymentWidget(
                  formKey: _formKey,
                  emailController: _emailController,
                  nameController: _nameController,
                  cardNumberController: _cardNumberController,
                  dateValidController: _dateValidController,
                  cvvController: _cvvController,
                ),
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
