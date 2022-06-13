import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({Key? key, required this.msg}) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return _buildBg(children: [
      const CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation(Colors.white),
      ),
      Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(msg, style: const TextStyle(color: Colors.white)),
      ),
    ]);
  }

  Widget _buildBg({required List<Widget> children}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(mainAxisSize: MainAxisSize.min, children: children),
    );
  }
}
