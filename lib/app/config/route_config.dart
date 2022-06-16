import 'package:get/get.dart';
import 'package:test_flutter/app/ui/web_view.dart';
import 'package:test_flutter/module/home/view.dart';

class RouteConfig {
  ///主页面
  static const String main = "/";

  static const String webView = "/webView";

  ///别名映射页面
  static final List<GetPage> getPages = [
    GetPage(name: main, page: () => const HomePage()),
    GetPage(name: webView, page: () => FlutterWebView(), transition: Transition.downToUp),
  ];
}
