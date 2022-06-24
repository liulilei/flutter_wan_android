import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

/// @author lll
/// @date on 2022/6/22
class QrCodeScreenPage extends StatefulWidget {
  const QrCodeScreenPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => QrCodeScreenPageState();
}

class QrCodeScreenPageState extends State<QrCodeScreenPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  bool isFlash = false;

// In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (GetPlatform.isAndroid) {
      controller?.pauseCamera();
    } else if (GetPlatform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: QRView(
        key: qrKey,
        overlay: QrScannerOverlayShape(borderColor: Colors.blue),
        onQRViewCreated: _onQRViewCreated,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller?.toggleFlash();
          isFlash = await controller?.getFlashStatus() ?? false;
          setState(() {});
        },
        child: Icon(size: 30.w, isFlash ? Icons.flashlight_on_rounded : Icons.flashlight_off_rounded, color: isFlash ? Colors.white : Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      Get.back(result: result?.code);
    });
    this.controller?.pauseCamera();
    this.controller?.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
