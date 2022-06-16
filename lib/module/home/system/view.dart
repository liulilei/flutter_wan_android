import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/ui/show.dart';
import 'package:test_flutter/module/home/system/widget/system_list.dart';

import '../../../app/ui/title_app_bar.dart';
import 'logic.dart';

class SystemPage extends StatelessWidget {
  const SystemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SystemLogic());
    final state = Get.find<SystemLogic>().state;

    return Scaffold(
        appBar: TitleAppBar(title: "体系", leading: Container()),
        body: GetBuilder<SystemLogic>(builder: (logic) {
          return SystemListPage(
            systemList: state.systemList,
            onRefresh: (controller) => {logic.getSystemList(false, controller: controller)},
            itemClick: (systemInfo) => {showToast("详情界面")},
          );
        }));
  }
}
