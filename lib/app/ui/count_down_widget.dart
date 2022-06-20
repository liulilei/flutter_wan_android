import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_flutter/app/typedef/function.dart';

/// @author lll
/// @date on 2022/6/17
class CountDownWidget extends StatefulWidget {
  const CountDownWidget({this.countDownTime = 3000, this.textStyle, this.circularColor = Colors.blue, required this.onTop, Key? key}) : super(key: key);

  final num countDownTime;

  final TextStyle? textStyle;

  final Color circularColor;

  final ParamVoidCallback onTop;

  @override
  State<StatefulWidget> createState() => _CountDownWidgetState();
}

class _CountDownWidgetState extends State<CountDownWidget> {
  ///声明变量
  late Timer _timer;

  ///记录当前的时间
  int currentTimer = 0;

  @override
  void initState() {
    super.initState();

    ///循环执行
    ///间隔1秒
    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      ///自增
      currentTimer += 100;
      setState(() {});

      ///到5秒后停止
      if (currentTimer >= widget.countDownTime + 100) {
        _timer.cancel();
        widget.onTop();
      }
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
            backgroundColor: widget.circularColor,
            color: Colors.white,

            ///当前指示的进度 0.0 -1.0
            value: 1 - currentTimer / widget.countDownTime,
          ),

          ///显示的文本
          GestureDetector(
            onTap: () => widget.onTop(),
            child: Text(
              "跳过",
              style: widget.textStyle ?? TextStyle(color: Colors.blue, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}
