import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget1 extends StatelessWidget {
  const CustomLoadingWidget1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 100.w, height: 100.w, child: Lottie.asset("images/loading1.json"));
  }
}
