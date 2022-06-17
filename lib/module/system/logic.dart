import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_flutter/entity/system_info.dart';
import 'package:test_flutter/http/http.dart';
import 'package:test_flutter/http/net/net_api.dart';

import 'state.dart';

class SystemLogic extends GetxController {
  final SystemState state = SystemState();

  @override
  void onInit() {
    super.onInit();
    getSystemList(true);
  }

  void getSystemList(bool hasDialog, {RefreshController? controller}) async {
    var systemList = await Http.get(NetApi.tree, isLoading: hasDialog);
    if (systemList == null) {
      controller?.refreshFailed();
      return;
    }
    controller?.refreshCompleted();
    state.systemList.assignAll((systemList as List).map((e) => SystemInfo.fromJson(e)).toList());
    update();
  }
}
