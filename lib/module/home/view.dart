import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());
    final state = Get.find<HomeLogic>().state;

    //第一个界面初始化屏幕适配，设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("测试类"),
        ),
      ),
      body: Obx(() {
        return Container(
            width: 360.w,
            height: 360.r,
            color: Colors.red,
            child: Text(
              "点击了 ${state.count} 次",
              style: TextStyle(fontSize: 30.sp),
            ));
      }),
      floatingActionButton: FloatingActionButton(
        child: const Text("自增"),
        onPressed: () {
          logic.increase();
        },
      ),
    );
  }
}
