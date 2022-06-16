import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  final String title;

  ///点击扫码的监听
  final Widget? leading;

  ///点击搜索的监听
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      toolbarHeight: 46.h,
      leading: leading,
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, color: Colors.white),
      ),
      actions: actions ?? [Container()],
    );
  }

  @override
  Size get preferredSize => getSize();

  Size getSize() {
    return Size.fromHeight(46.h);
  }
}
