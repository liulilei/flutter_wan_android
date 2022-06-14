import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:test_flutter/widget/custom_loading_widget.dart';
import 'package:test_flutter/widget/custom_toast_widget.dart';

import 'app/config/route_config.dart';
import 'app/helper/getx_route_observer.dart';
import 'http/http.dart';
import 'http/net/net_api.dart';

void main() async {
  // 解决启动白屏问题 或 Flutter2.5+首屏页面复杂，导致的加载异常问题
  // main()方法并不是在Flutter给physicalSize赋值后才运行的，
  // 这就导致部分机型性能比较好，还没赋值屏幕大小就可能启动渲染界面了。
  // 如果size为有数值，监听测量回调，在回调中runApp
  if (window.physicalSize.isEmpty) {
    metricsFinish() async {
      if (!window.physicalSize.isEmpty) {
        window.onMetricsChanged = null;
        // Add this line
        await ScreenUtil.ensureScreenSize();
        runApp(const MyApp());
      }
    }

    window.onMetricsChanged = metricsFinish;
  } else {
    // Add this line
    await ScreenUtil.ensureScreenSize();
    runApp(const MyApp());
  }
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明

    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, //全局设置透明

        statusBarIconBrightness: Brightness.light

        //light:黑色图标 dark：白色图标

        //在此处设置statusBarIconBrightness为全局设置

        );

    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  ///初始化HTTP
  Http.init(baseUrl: NetApi.baseUrl);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'WanAndroid',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteConfig.main,
      getPages: RouteConfig.getPages,
      navigatorObservers: [FlutterSmartDialog.observer, GetXRouteObserver()],
      builder: FlutterSmartDialog.init(
        toastBuilder: (String msg) => CustomToastWidget(msg: msg),
        loadingBuilder: (String msg) => const CustomLoadingWidget(msg: "加载中"),
        builder: _builder,
      ),
    );
  }
}

Widget _builder(BuildContext context, Widget? child) {
  return MediaQuery(
    ///设置字体不随系统字体变化
    data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
    child: child!,
  );
}
