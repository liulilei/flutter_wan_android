import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../entity/project_tree_info.dart';

/// @author lll
/// @date on 2022/6/14
class MainTabBarPage extends StatelessWidget implements PreferredSizeWidget {
  const MainTabBarPage({
    Key? key,
    required this.projectTreeList,
  }) : super(key: key);

  final List<ProjectTreeInfo> projectTreeList;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      padding: EdgeInsets.only(bottom: 1.h),
      tabs: projectTreeList.map((e) => Tab(text: e.name)).toList(),
      isScrollable: true,
    );
  }

  @override
  Size get preferredSize => getSize();

  Size getSize() {
    return Size.fromHeight(46.h);
  }
}
