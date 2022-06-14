import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter/app/typedef/function.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key,
    required this.onScanTap,
    required this.onSearchTap,
  }) : super(key: key);

  ///点击扫码的监听
  final ParamVoidCallback onScanTap;

  ///点击搜索的监听
  final ParamVoidCallback onSearchTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 46.h,
      leading: GestureDetector(
        onTap: () => onScanTap(),
        child: const Icon(Icons.qr_code_scanner_rounded),
      ),
      title: Center(
        child: Text(
          "首页",
          style: TextStyle(fontSize: 16.sp, color: Colors.white),
        ),
      ),
      actions: [
        Container(
          padding: EdgeInsets.only(right: 16.w),
          child: GestureDetector(
            onTap: () => onSearchTap(),
            child: const Icon(Icons.search_rounded),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => getSize();

  Size getSize() {
    return Size.fromHeight(46.h);
  }
}
