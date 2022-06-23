import 'dart:collection';

import '../../../entity/article_info.dart';

class SystemDetailState {
  late SplayTreeMap<int, ArticleInfo> articleInfo;

  late Map<int, int> loadPageMap;

  SystemDetailState() {
    articleInfo = SplayTreeMap<int, ArticleInfo>();

    loadPageMap = {};
  }
}
