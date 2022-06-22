import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_flutter/app/config/route_config.dart';
import 'package:test_flutter/constants/constants.dart';
import 'package:test_flutter/entity/article_info.dart';
import 'package:test_flutter/entity/banner_info.dart';
import 'package:test_flutter/entity/project_tree_info.dart';
import 'package:test_flutter/http/http.dart';
import 'package:test_flutter/http/net/net_api.dart';
import 'package:test_flutter/utils/request_permission.dart';

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

  void clickScan() async {
    bool hasPermission = await PermissionUtils.requestPermission(Permission.camera);
    if (hasPermission) {
      String? result = await Get.toNamed(RouteConfig.qrScreen);
      if (result?.isNotEmpty == true) {
        showToast(result);
      }
    }
  }

  void getProjectList() async {
    var projectResult = await Http.get(NetApi.projectTree);
    state.projectTreeList.assignAll((projectResult as List).map((e) => ProjectTreeInfo.fromJson(e)).toList());
    update();
  }

  void getBannerList() async {
    var bannerList = await Http.get(NetApi.banner);
    state.bannerList = (bannerList as List).map((e) => BannerInfo.fromJson(e)).toList();
    update();
  }

  void getProjectArticle(int pageNo, int id, int index, bool hasDialog, {RefreshController? controller}) async {
    var articleJson = await Http.get(NetApi.projectArticle(pageNo, id), isLoading: hasDialog);
    if (articleJson == null) {
      if (controller?.isRefresh == true) {
        controller?.refreshFailed();
      }
      if (controller?.isLoading == true) {
        controller?.loadFailed();
      }
      return;
    }
    var articleInfo = ArticleInfo.fromJson(articleJson);
    state.loadPageMap[index] = articleInfo.curPage ?? pageNo;
    if (pageNo == Constants.defaultPageNo) {
      state.articleInfo[index] = articleInfo;
      controller?.refreshCompleted(resetFooterState: true);
    } else {
      state.articleInfo[index]?.addData(articleInfo, false);
      if (articleInfo.over == false) {
        controller?.loadComplete();
      } else {
        controller?.loadNoData();
      }
    }
    update();
  }
}
