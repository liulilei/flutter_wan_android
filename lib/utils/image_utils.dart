import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// @author lll
/// @date on 2022/6/15
class ImageUtils {
  static Widget loadNormalImg(String url, {String placeholder = "images/default_img.png"}) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Image.asset(placeholder, fit: BoxFit.fill),
      errorWidget: (context, url, error) => Image.asset("images/default_img.png", fit: BoxFit.fill),
      fit: BoxFit.fill,
    );
  }
}
