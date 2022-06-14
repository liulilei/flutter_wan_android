import 'package:get/get.dart';

import '../../../entity/banner_info.dart';
import '../../../entity/project_tree_info.dart';

class MainState {
  late List<ProjectTreeInfo> projectTreeList;

  late List<BannerInfo> bannerList;

  MainState() {
    projectTreeList = <ProjectTreeInfo>[].obs;

    bannerList = [];
  }
}
