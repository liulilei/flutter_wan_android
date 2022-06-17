import 'package:get/get.dart';

class PersonState {

  late RxBool showTitle;

  PersonState() {
    showTitle = false.obs;
  }
}
