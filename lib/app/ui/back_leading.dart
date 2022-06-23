import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// @author lll
/// @date on 2022/6/23
class BackLeading extends StatelessWidget {
  /// Creates a Material Design close button.
  const BackLeading({Key? key, this.color, this.onPressed}) : super(key: key);

  final Color? color;

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_rounded),
      color: color ?? Colors.white,
      tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
      onPressed: () {
        if (onPressed != null) {
          onPressed!();
        } else {
          Get.back();
        }
      },
    );
  }
}
