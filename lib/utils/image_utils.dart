import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// @author lll
/// @date on 2022/6/15
class ImageUtils {
  static Widget loadNormalImg(String url, {String placeholder = "images/default_img.png", double? width, double? height}) {
    return CachedNetworkImage(
      imageUrl: url,
      width: width,
      height: height,
      placeholder: (context, url) => Image.asset(placeholder, fit: BoxFit.fill),
      errorWidget: (context, url, error) => Image.asset(placeholder, fit: BoxFit.fill),
      fit: BoxFit.fill,
    );
  }
}
