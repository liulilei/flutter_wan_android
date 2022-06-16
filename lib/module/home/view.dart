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
      bottomNavigationBar: Obx(() {
        return Theme(
          data: Theme.of(context).copyWith(splashFactory: NoSplash.splashFactory),
          child: BottomNavigationBar(
              items: state.navigateItems,
              currentIndex: state.currentIndex.value,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedFontSize: 13.sp,
              unselectedFontSize: 12.sp,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              onTap: (int index) {
                logic.selectIndex(index);
              }),
        );
      }),
      body: Obx(() {
        return IndexedStack(
          index: state.currentIndex.value,
          children: state.pageList,
        );
      }),
    );
  }
}
