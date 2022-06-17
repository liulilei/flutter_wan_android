import 'package:get/get.dart';

import '../../../entity/navigate_info.dart';

class NavigateState {
  late List<NavigateInfo> navigateList;

  late RxInt currentNavi;

  NavigateState() {
    navigateList = <NavigateInfo>[].obs;

    currentNavi = 0.obs;
  }
}
