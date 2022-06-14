import 'package:get/get.dart';

import 'state.dart';

class HomeLogic extends GetxController {
  final state = HomeState();

  void selectIndex(int index) => state.currentIndex.value = index;
}
