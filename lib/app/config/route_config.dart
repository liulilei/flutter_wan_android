import 'package:get/get.dart';
import 'package:test_flutter/app/ui/web_view.dart';
import 'package:test_flutter/module/home/view.dart';
import 'package:test_flutter/module/main/qr_code_screen/QrCodeScreen.dart';
import 'package:test_flutter/module/system/system_detail/view.dart';

import '../../module/splash/view.dart';

class RouteConfig {
  ///启动图
  static const String splash = "/";

  ///主页面
  static const String main = "/main";

  static const String webView = "/webView";

  static const String qrScreen = "/qrScreen";

  static const String systemDetail = "/systemDetail";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: splash, page: () => const SplashPage(), transition: Transition.leftToRight),
    GetPage(name: main, page: () => const HomePage()),
    GetPage(name: webView, page: () => FlutterWebView()),
    GetPage(name: qrScreen, page: () => const QrCodeScreenPage()),
    GetPage(name: systemDetail, page: () => const SystemDetailPage()),
  ];
}
