import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// @author lll
/// @date on 2022/6/17
class CountDownWidget extends StatefulWidget {
  const CountDownWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  ///声明变量
  late Timer _timer;

  ///记录当前的时间
  int currentTimer = 0;

  int countDown = 3000;

  @override
  void initState() {
    super.initState();

    ///循环执行
    ///间隔1秒
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      ///自增
      currentTimer += 100;

      ///到5秒后停止
      if (currentTimer >= countDown) {
        _timer.cancel();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    ///取消计时器
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        ///子Widget居中
        alignment: Alignment.center,
        children: [
          ///圆形进度
          CircularProgressIndicator(
            strokeWidth: 2.5.w,
            backgroundColor: Colors.blue,
            color: Colors.white,

            ///当前指示的进度 0.0 -1.0
            value: 1 - currentTimer / 3000,
          ),

          ///显示的文本
          Text(
            "跳过",
            style: TextStyle(color: Colors.blue, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
