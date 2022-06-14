import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:test_flutter/app/ui/show.dart';

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
          return CachedNetworkImage(
            imageUrl: bannerList[index].imagePath ?? "",
            placeholder: (context, url) => Image.asset("images/default_img.png", fit: BoxFit.fill),
            errorWidget: (context, url, error) => Image.asset("images/default_img.png", fit: BoxFit.fill),
            fit: BoxFit.fill,
          );
        },
        itemCount: bannerList.length,
        pagination: const SwiperPagination(alignment: Alignment.bottomCenter),
        loop: true,
        autoplay: true,
        onTap: (int index) => showToast("点击啦"),
      ),
    );
  }
}
