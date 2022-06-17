import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/ui/title_app_bar.dart';
import 'package:test_flutter/module/navigate/wdiget/navigate_left.dart';
import 'package:test_flutter/module/navigate/wdiget/navigate_right.dart';

import '../../../app/ui/web_view.dart';
import 'logic.dart';

class NavigatePage extends StatelessWidget {
  const NavigatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(NavigateLogic());
    final state = Get.find<NavigateLogic>().state;

    return Scaffold(
      appBar: TitleAppBar(
        title: "导航",
        leading: Container(),
      ),
      body: Obx(() {
        return Row(
          children: [
            NavigateLeftPage(
              navigateList: state.navigateList,
              currentNavi: state.currentNavi.value,
              itemClick: (index) => logic.setCurrentNavi(index),
            ),
            NavigateRightPage(
              articles: state.navigateList[state.currentNavi.value].articles ?? [],
              itemClick: (navigateInfoArticles) => FlutterWebView.start(navigateInfoArticles?.title, navigateInfoArticles?.link),
            ),
          ],
        );
      }),
    );
  }
}
