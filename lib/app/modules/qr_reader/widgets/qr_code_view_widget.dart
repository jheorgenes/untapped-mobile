import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';

class QrCodeViewWidget extends StatefulWidget {
  final Function(String? qrCode) onResultQrCode;
  const QrCodeViewWidget({
    super.key,
    required this.onResultQrCode,
  });

  @override
  State<QrCodeViewWidget> createState() => _QrCodeViewWidgetState();
}

class _QrCodeViewWidgetState extends State<QrCodeViewWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      controller.pauseCamera();
      widget.onResultQrCode(scanData.code);
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: context.widthTransformer(reducedBy: 30),
            padding: const EdgeInsets.all(15),
            child: const Center(
              child: Text(
                'Validação de QR code',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15.0),
            clipBehavior: Clip.hardEdge,
            width: 300,
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButtonUi(
            callback: () {
              controller!.resumeCamera();
            },
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Iniciar novo escaneamento'),
            ),
          )
        ],
      ),
    );
  }
}
