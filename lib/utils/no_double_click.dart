import '../app/ui/show.dart';

/// @author lll
/// @date on 2022/6/22
class NoDoubleClick {

  static DateTime? lastPopTime;

  static onWillPop() {
    if (lastPopTime == null ||
        DateTime.now().difference(lastPopTime!) > const Duration(seconds: 2)) {
      lastPopTime = DateTime.now();
      showToast("再按一次退出");
      return false;
    } else {
      lastPopTime = DateTime.now();
      // 退出app
      return true;
    }
  }
}