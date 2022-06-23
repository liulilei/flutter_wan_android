import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/ui/back_leading.dart';
import 'package:test_flutter/app/ui/keep_alive_page.dart';
import 'package:test_flutter/app/ui/title_app_bar.dart';
import 'package:test_flutter/entity/system_info.dart';
import 'package:test_flutter/module/main/widget/main_tab_bar_view.dart';

import '../../../app/ui/lazy_load_builder.dart';
import '../../../app/ui/web_view.dart';
import '../../../constants/constants.dart';
import 'logic.dart';

class SystemDetailPage extends StatelessWidget {
  const SystemDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SystemDetailLogic());
    final state = Get.find<SystemDetailLogic>().state;

    final systemInfo = Get.arguments as SystemInfo;

    final children = systemInfo.children ?? [];

    return DefaultTabController(
      length: children.length,
      child: Scaffold(
        appBar: TitleAppBar(
          title: systemInfo.name ?? "",
          leading: const BackLeading(),
        ),
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Material(
                color: Colors.blue,
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white60,
                  isScrollable: true,
                  tabs: children.map((e) => Tab(text: e.name)).toList(),
                ),
              ),
            ),
            GetBuilder<SystemDetailLogic>(builder: (logic) {
              return Expanded(
                child: TabBarView(
                  children: children.asMap().entries.map((e) {
                    if (state.articleInfo[e.key]?.datas != null) {
                      return KeepAlivePage(MainTabBarViewPage(
                        articleInfo: state.articleInfo[e.key],
                        itemClick: (articleInfo) => FlutterWebView.start(articleInfo?.title, articleInfo?.link),
                        onRefresh: (controller) => logic.getSystemArticle(Constants.defaultPageNo, e.value.id ?? 0, e.key, false, controller: controller),
                        onLoading: (controller) => logic.getSystemArticle(state.loadPageMap[e.key]! + 1, e.value.id ?? 0, e.key, false, controller: controller),
                      ));
                    } else {
                      return LazyLoadBuilder(onBuild: () => logic.getSystemArticle(Constants.defaultPageNo, e.value.id ?? 0, e.key, true));
                    }
                  }).toList(),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
