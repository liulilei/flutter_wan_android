import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter/app/typedef/function.dart';
import 'package:test_flutter/entity/navigate_info.dart';

/// @author lll
/// @date on 2022/6/17
class NavigateLeftPage extends StatelessWidget {
  const NavigateLeftPage({
    required this.navigateList,
    required this.currentNavi,
    required this.itemClick,
    Key? key,
  }) : super(key: key);

  final List<NavigateInfo> navigateList;

  final int currentNavi;

  final ParamSingleCallback<int> itemClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return _buildNavigateItem(navigateList[index], index);
        },
        separatorBuilder: (context, index) {
          return const Divider(height: 0);
        },
        itemCount: navigateList.length,
      ),
    );
  }

  Widget _buildNavigateItem(NavigateInfo navigate, int index) {
    return Ink(
      ///给InkWell内部的组件设置颜色，会导致InkWell点击水波纹效果消失，需要在外面套一层Ink或Material组件
      color: index == currentNavi ? Colors.white : Colors.grey[200],
      child: InkWell(
        onTap: () => itemClick(index),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11.h),
          alignment: Alignment.center,
          child: Text(
            navigate.name ?? "",
            style: TextStyle(fontSize: 13.sp, color: index == currentNavi ? Colors.blue : Colors.black),
          ),
        ),
      ),
    );
  }
}
