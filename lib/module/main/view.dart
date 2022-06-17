import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/ui/keep_alive_page.dart';
import 'package:test_flutter/app/ui/title_app_bar.dart';
import 'package:test_flutter/app/ui/web_view.dart';
import 'package:test_flutter/constants/constants.dart';
import 'package:test_flutter/module/main/widget/main_banner.dart';
import 'package:test_flutter/module/main/widget/main_tab_bar.dart';
import 'package:test_flutter/module/main/widget/main_tab_bar_view.dart';

import '../../../app/ui/lazy_load_builder.dart';
import 'logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainLogic());
    final state = Get.find<MainLogic>().state;

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return GetBuilder<MainLogic>(builder: (logic) {
      return DefaultTabController(
        length: state.projectTreeList.length,
        child: Scaffold(
          appBar: TitleAppBar(
              title: "首页",
              leading: GestureDetector(
                onTap: () => logic.clickScan(),
                child: const Icon(Icons.qr_code_scanner_rounded),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.only(right: 16.w),
                  child: GestureDetector(
                    onTap: () => logic.clickSearch(),
                    child: const Icon(Icons.search_rounded),
                  ),
                )
              ]),
          body: ExtendedNestedScrollView(
            onlyOneScrollInBody: true,
            headerSliverBuilder: (BuildContext context, bool flag) {
              return [
                SliverAppBar(
                  toolbarHeight: 135.h,
                  expandedHeight: 181.h,
                  pinned: true,
                  floating: true,
                  titleSpacing: 0,
                  title: MainBannerPage(bannerList: state.bannerList),
                  bottom: MainTabBarPage(projectTreeList: state.projectTreeList),
                )
              ];
            },
            body: TabBarView(
              children: state.projectTreeList.asMap().entries.map((e) {
                if ((state.articleInfo[e.key]?.datas ?? []).isNotEmpty) {
                  return KeepAlivePage(MainTabBarViewPage(
                    articleInfo: state.articleInfo[e.key],
                    itemClick: (articleInfo) => FlutterWebView.start(articleInfo?.title, articleInfo?.link),
                    onRefresh: (controller) => logic.getProjectArticle(Constants.defaultPageNo, e.value.id ?? 0, e.key, false, controller: controller),
                    onLoading: (controller) => logic.getProjectArticle(state.loadPageMap[e.key]! + 1, e.value.id ?? 0, e.key, false, controller: controller),
                  ));
                } else {
                  return LazyLoadBuilder(onBuild: () => logic.getProjectArticle(Constants.defaultPageNo, e.value.id ?? 0, e.key, true));
                }
              }).toList(),
            ),
            physics: const BouncingScrollPhysics(),
          ),
        ),
      );
    });
  }
}
