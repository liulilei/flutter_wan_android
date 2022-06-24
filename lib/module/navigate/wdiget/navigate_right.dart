import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_flutter/entity/navigate_info.dart';

import '../../../../app/typedef/function.dart';

/// @author lll
/// @date on 2022/6/17
class NavigateRightPage extends StatelessWidget {
  const NavigateRightPage({required this.articles, required this.itemClick, Key? key}) : super(key: key);

  final List<NavigateInfoArticles> articles;

  final ParamSingleCallback<NavigateInfoArticles> itemClick;

  @override
  Widget build(BuildContext context) {
    if (articles.isBlank == true) {
      return Expanded(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Text("Nav is null"),
        ),
      );
    }
    final articleList = articles
        .map((item) => Padding(
              padding: EdgeInsets.all(5.w),

              ///使用DecoratedBox+InkWell看不到点击效果，需要使用Ink组件
              child: Ink(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.0), color: Colors.grey[200]),
                child: InkWell(
                  onTap: () => itemClick(item),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
                    child: Text(
                      item.title!,
                      style: TextStyle(fontSize: 13.sp, color: _getRandomColor()),
                    ),
                  ),
                ),
              ),
            ))
        .toList();
    return Expanded(
      ///子组件超出，使用滚动布局，不滚动标题，只滚动标签
      child: Container(
        padding: EdgeInsets.all(10.w),
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Wrap(
            children: articleList,
          ),
        ),
      ),
    );
  }

  _getRandomColor() {
    return [
      Colors.blue,
      Colors.red,
      Colors.green,
      Colors.amber,
      Colors.cyan,
      Colors.deepOrangeAccent,
      Colors.deepPurple,
      Colors.black,
      Colors.pinkAccent
    ][Random.secure().nextInt(9)];
  }
}
