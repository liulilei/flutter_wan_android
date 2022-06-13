import 'package:get/state_manager.dart';

class HomeState {
  late RxInt count;

  HomeState() {
    count = 0.obs;
  }
}
