import 'dart:collection';

import 'package:test_flutter/entity/article_info.dart';

import '../../../entity/banner_info.dart';
import '../../../entity/project_tree_info.dart';

class MainState {
  late List<ProjectTreeInfo> projectTreeList;

  late List<BannerInfo> bannerList;

  late SplayTreeMap<int, ArticleInfo> articleInfo;

  late Map<int, int> loadPageMap;

  MainState() {
    projectTreeList = [];

    bannerList = [];

    articleInfo = SplayTreeMap<int, ArticleInfo>();

    loadPageMap = {};
  }
}
