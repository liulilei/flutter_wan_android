import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:test_flutter/app/typedef/function.dart';

import '../../../../entity/system_info.dart';

/// @author lll
/// @date on 2022/6/16
class SystemListPage extends StatelessWidget {
  SystemListPage({required this.systemList, required this.onRefresh, required this.itemClick, Key? key}) : super(key: key);

  final List<SystemInfo> systemList;

  final RefreshController controller = RefreshController();

  final ParamSingleCallback<RefreshController> onRefresh;

  final ParamSingleCallback<SystemInfo> itemClick;

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration.copyAncestor(
        headerBuilder: () => const WaterDropMaterialHeader(),
        context: context,
        child: SmartRefresher(
          controller: controller,
          enablePullDown: true,
          onRefresh: () => onRefresh(controller),
          child: ListView.separated(
            itemCount: systemList.length,
            itemBuilder: (_, i) => _buildTree(systemList[i]),
            separatorBuilder: (_, i) => const Divider(),
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              //这里的边距是ListView上下边距，不是item边距
              vertical: 10.h,
            ),
          ),
        ));
  }

  Widget _buildTree(SystemInfo tree) {
    final subTree = tree.children!.map((item) => item.name).join("、");
    return InkWell(
      onTap: () => itemClick(tree),
      child: Row(
        children: [
          ///Expand弹性布局，按比例分配剩余空间，类似于Android Weight=1
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
                  child: Text(
                    tree.name!,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  subTree,
                  style: TextStyle(
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 12.w,
          ),
        ],
      ),
    );
  }
}
