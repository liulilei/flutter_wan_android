import 'package:get/get.dart';
import 'package:test_flutter/entity/article_info.dart';
import 'package:test_flutter/entity/banner_info.dart';
import 'package:test_flutter/entity/project_tree_info.dart';
import 'package:test_flutter/http/http.dart';
import 'package:test_flutter/http/net/net_api.dart';

import '../../../app/ui/show.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();

  @override
  void onInit() {
    super.onInit();
    getProjectList();
    getBannerList();
  }

  void clickScan() {
    showToast("扫码");
  }

  void clickSearch() {
    showToast("搜索");
  }

  void getProjectList() async {
    var projectResult = await Http.get(NetApi.projectTree);
    state.projectTreeList.assignAll((projectResult as List).map((e) => ProjectTreeInfo.fromJson(e)).toList());
    update();
  }

  void getBannerList() async {
    var bannerList = await Http.get(NetApi.banner, isLoading: false);
    state.bannerList = (bannerList as List).map((e) => BannerInfo.fromJson(e)).toList();
    update();
  }

  void getProjectArticle(int id, int index) async {
    var articleInfo = await Http.get(NetApi.projectArticle(1, id));
    state.articleInfo[index] = ArticleInfo.fromJson(articleInfo);
    update();
  }
}
