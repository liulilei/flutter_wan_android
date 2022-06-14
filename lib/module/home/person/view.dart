import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PersonLogic());
    final state = Get.find<PersonLogic>().state;

    return const Center(
      child: Text("我的"),
    );
  }
}
