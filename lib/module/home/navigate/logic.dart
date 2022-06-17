import 'package:get/get.dart';
import 'package:test_flutter/entity/navigate_info.dart';
import 'package:test_flutter/http/http.dart';
import 'package:test_flutter/http/net/net_api.dart';

import 'state.dart';

class NavigateLogic extends GetxController {
  final NavigateState state = NavigateState();

  @override
  void onInit() {
    super.onInit();
    getNavigateList();
  }

  void getNavigateList() async {
    var navigate = await Http.get(NetApi.navi);
    if (navigate == null) {
      return;
    }
    state.navigateList.assignAll((navigate as List).map((e) => NavigateInfo.fromJson(e)).toList());
  }

  void setCurrentNavi(int index) {
    state.currentNavi.value = index;
  }
}
