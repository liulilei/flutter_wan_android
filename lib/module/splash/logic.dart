import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();

  @override
  void onInit() {
    super.onInit();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void onClose() {
    super.onClose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}
