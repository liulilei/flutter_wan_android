import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

/// @author lll
/// @date on 2022/6/20
class PermissionUtils {
  static Future<bool> requestPermission(Permission permission) async {
    PermissionStatus status = await permission.request();
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      //权限拒绝， 需要区分IOS和Android，二者不一样
      // return request(permission);
      if (Platform.isIOS) {
        openAppSettings();
      }
      return false;
    } else if (status.isPermanentlyDenied) {
      //权限永久拒绝，且不在提示，需要进入设置界面
      openAppSettings();
      return false;
    } else if (status.isRestricted) {
      //活动限制（例如，设置了家长///控件，仅在iOS以上受支持。
      openAppSettings();
      return false;
    } else {
      //第一次申请
      // return request(permission);
      if (Platform.isIOS) {
        openAppSettings();
      }
      return false;
    }
  }

  // //申请权限
  // static Future<bool> request(Permission permission) async {
  //   PermissionStatus status = await permission.request();
  //   if (!status.isGranted) {
  //     if (Platform.isIOS) {
  //       openAppSettings();
  //     }
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }
}
