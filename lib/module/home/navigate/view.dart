import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(NavigateLogic());
    final state = Get.find<NavigateLogic>().state;

    return const Center(
      child: Text("导航"),
    );
  }
}
