import 'package:get/get.dart';

import 'state.dart';

class PersonLogic extends GetxController {
  final PersonState state = PersonState();

  void setShowTitle(bool showTitle) {
    state.showTitle.value = showTitle;
  }
}
