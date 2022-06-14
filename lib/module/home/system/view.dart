import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SystemPage extends StatelessWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SystemLogic());
    final state = Get.find<SystemLogic>().state;

    return const Center(
      child: Text("体系"),
    );
  }
}
