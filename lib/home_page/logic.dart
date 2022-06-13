import 'package:get/get.dart';

import 'state.dart';

class HomePageLogic extends GetxController {
  final state = HomePageState();

  void increase() => state.count++;
}
