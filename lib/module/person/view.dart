import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_flutter/app/ui/web_view.dart';
import 'package:test_flutter/utils/image_utils.dart';

import 'logic.dart';

class PersonPage extends StatelessWidget {
  const PersonPage({Key? key}) : super(key: key);

  static const desc = '''本项目使用GetX框架搭建，包含以下技术点：
  * 页面路由
  * 状态管理
  * Dio网络请求
  * pull_to_refresh 下拉刷新，上拉加载
  * 图片加载
  * Lottie动画加载
  * 屏幕适配
  * UI：Tab页面、侧边抽屉栏、列表、富文本等
  * WebView加载网页
  * android/ios 配置启动页
  * 权限申请
  * 扫描二维码
  
解决问题：
  * Flutter项目目录结构和代码组织
  * 网络请求封装
  * Tab页懒加载
  * Tab页ListView滑动时，其他tab跟着滑动
  * qr_code_scanner release下白屏不能使用stack包裹
  * release下Expanded显示灰屏，Expanded、Flexible只在Row、Column等组件内，不在其他组件内使用。

基于GitHub开源项目学习：''';

  static const desc2 = "\n\n感谢鸿洋大神的WanAndroid Api：";
  static const wanContent = '''
本网站每天新增20~30篇优质文章，并加入到现有分类中，力求整理出一份优质而又详尽的知识体系，闲暇时间不妨上来学习下知识； 除此以外，并为大家提供平时开发过程中常用的工具以及常用的网址导航。

当然这只是我们目前的功能，未来我们将提供更多更加便捷的功能...

如果您有任何好的建议:
可以在 ''';

  static const issueUrl = "https://github.com/liulilei";
  static const sampleUrl = "https://github.com/Afauria/GetX-WanAndroid";
  static const apiUrl = "https://www.wanandroid.com/blog/show/2";

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(PersonLogic());
    final state = Get.find<PersonLogic>().state;
    final barHeight = 150.h - 46.h;

    ScrollController controller = ScrollController();

    controller.addListener(() => {logic.setShowTitle(controller.hasClients && controller.offset > barHeight)});

    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: ImageUtils.loadNormalImg(
                  "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F711%2F0Z113110452%2F130Z1110452-7-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1658039063&t=cb6c7305a3f4491f438ac13e8d6cf677"),
              collapseMode: CollapseMode.pin,
              stretchModes: const <StretchMode>[StretchMode.zoomBackground, StretchMode.fadeTitle, StretchMode.blurBackground],
            ),
            expandedHeight: 150.h,
            floating: true,
            pinned: true,
            snap: false,
            title: Obx(() {
              return Text(
                state.showTitle.value ? "我的" : "",
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              );
            }),
            toolbarHeight: 46.h,
            centerTitle: true,
            stretch: true,
            //是否可拉伸伸展
            onStretchTrigger: () async {
              return;
            },
            stretchTriggerOffset: 40.h, //触发拉伸偏移量
          ),
          SliverPadding(
            padding: EdgeInsets.all(10.w),
            sliver: SliverToBoxAdapter(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Flutter WanAndroid实战",
                      style: TextStyle(fontSize: 24.w),
                    ),
                    Text(
                      "Lll",
                      style: TextStyle(fontSize: 15.w),
                    ),

                    ///富文本
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "项目说明\n\n",
                        style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: desc,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      TextSpan(
                        text: sampleUrl,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.sp,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => FlutterWebView.start("Afauria", sampleUrl),
                      ),
                      TextSpan(
                        text: desc2,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      TextSpan(
                        text: apiUrl,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 14.sp,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () => FlutterWebView.start("wanandroid", apiUrl),
                      ),
                      const TextSpan(text: "\n\n"),
                      TextSpan(
                        text: "WanAndroid网站内容\n\n",
                        style: TextStyle(fontSize: 18.w, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: wanContent, style: TextStyle(fontSize: 14.sp)),
                      TextSpan(
                        text: issueUrl,
                        style: TextStyle(color: Colors.blue, fontSize: 14.sp),
                        recognizer: TapGestureRecognizer()..onTap = () => FlutterWebView.start("liulilei", issueUrl),
                      ),
                      const TextSpan(text: " 项目中以issue的形式提出，我将及时跟进。"),
                    ])),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
