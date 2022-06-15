import 'package:flutter/material.dart';

class LazyLoadBuilder extends StatelessWidget {
  final Function()? onBuild;

  const LazyLoadBuilder({Key? key, this.onBuild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (onBuild != null) {
      onBuild!();
    }
    return Container();
  }
}
