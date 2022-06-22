import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/config/route_config.dart';
import 'package:test_flutter/app/ui/count_down_widget.dart';
import 'package:test_flutter/utils/image_utils.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    /// 第一个界面初始化屏幕适配，设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(context, designSize: const Size(360, 690));

    return WillPopScope(
      onWillPop: () => Future(() => false),
      child: Stack(children: [
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: ImageUtils.loadNormalImg("https://img2.baidu.com/it/u=1411744425,2351353163&fm=253&fmt=auto&app=138&f=JPEG?w=1080&h=1920"),
        ),
        Positioned(
          top: 50.h,
          right: 16.w,
          child: CountDownWidget(
            onTop: () => Get.offAndToNamed(RouteConfig.main),
          ),
        ),
      ]),
    );
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }
}
