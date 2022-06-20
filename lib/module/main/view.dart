import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
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
import '../../utils/image_utils.dart';
import 'logic.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MainLogic());
    final state = Get.find<MainLogic>().state;

    return GetBuilder<MainLogic>(builder: (logic) {
      return DefaultTabController(
        length: state.projectTreeList.length,
        child: Scaffold(
          appBar: TitleAppBar(title: "首页",
              // leading: GestureDetector(
              //   onTap: () => logic.clickScan(),
              //   child: const Icon(Icons.qr_code_scanner_rounded),
              // ),
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
                  automaticallyImplyLeading: false,
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
          drawer: Container(
            width: 250.w,
            height: double.infinity,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageUtils.loadNormalImg(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202003%2F21%2F20200321171802_etypu.thumb.1000_0.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658303279&t=24202894765df2a0797ce5878cc96116",
                  width: 250.w,
                ),
                InkWell(
                  onTap: () => FlutterWebView.start("Liull", "https://github.com/liulilei"),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person_rounded, color: Colors.black),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "关于我们",
                          style: TextStyle(fontSize: 14.sp, color: Colors.black),
                        ),
                        const Icon(
                          Icons.arrow_right_rounded,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
