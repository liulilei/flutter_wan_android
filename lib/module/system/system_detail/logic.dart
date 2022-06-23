import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constants/constants.dart';
import '../../../entity/article_info.dart';
import '../../../http/http.dart';
import '../../../http/net/net_api.dart';
import 'state.dart';

class SystemDetailLogic extends GetxController {
  final SystemDetailState state = SystemDetailState();

  void getSystemArticle(int pageNo, int id, int index, bool hasDialog, {RefreshController? controller}) async {
    var articleJson = await Http.get(NetApi.articleArticle(pageNo, id), isLoading: hasDialog);
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
