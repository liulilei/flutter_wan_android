import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:test_flutter/app/ui/show.dart';
import 'package:test_flutter/app/ui/web_view.dart';
import 'package:test_flutter/utils/image_utils.dart';

import '../../../../entity/banner_info.dart';

/// @author lll
/// @date on 2022/6/14
class MainBannerPage extends StatelessWidget {
  const MainBannerPage({Key? key, required this.bannerList}) : super(key: key);

  final List<BannerInfo> bannerList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 135.h,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ImageUtils.loadNormalImg(bannerList[index].imagePath ?? "");
        },
        itemCount: bannerList.length,
        pagination: const SwiperPagination(alignment: Alignment.bottomCenter),
        loop: true,
        autoplay: true,
        onTap: (int index) => FlutterWebView.start(bannerList[index].title, bannerList[index].url),
      ),
    );
  }
}
