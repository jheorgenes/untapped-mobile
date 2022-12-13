import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:untapped/app/modules/qr_reader/widgets/qr_code_view_widget.dart';
import '../../core/widgets_ui/app_bar_navigator.dart';
import './qr_reader_controller.dart';

class QrReaderPage extends GetView<QrReaderController> {
  const QrReaderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBarNavigator(
        title: 'Leitor de código',
        showIcon: false,
        color: Theme.of(context).backgroundColor,
      ),
      body: Column(
        children: [
          QrCodeViewWidget(onResultQrCode: (qrCode) async {
            if (qrCode != null) {
              Get.defaultDialog(
                content: Column(
                  children: const [
                    Text('Validando ticket!'),
                    SizedBox(
                      height: 10,
                    ),
                    CircularProgressIndicator(),
                  ],
                ),
              );
              controller.validateQrCode(qrCode).then((value) {
                Get.back();
                if (value) {
                  Get.defaultDialog(
                    title: '',
                    content: const Text('Ticket validado com sucesso!'),
                  );
                } else {
                  Get.defaultDialog(
                    title: '',
                    content: const Text('Ticket inválido!'),
                  );
                }
              });
            }
          }),
        ],
      ),
    );
  }
}
