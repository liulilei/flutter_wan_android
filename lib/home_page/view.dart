import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePagePage extends StatelessWidget {
  const HomePagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomePageLogic());
    final state = Get.find<HomePageLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("测试类"),
        ),
      ),
      body: Center(
        child: Obx(() {
          return Text("点击了 ${state.count} 次");
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text("自增"),
        onPressed: () {
          logic.increase();
        },
      ),
    );
  }
}
