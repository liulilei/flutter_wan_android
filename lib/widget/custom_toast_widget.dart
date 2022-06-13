import 'package:flutter/material.dart';

class CustomToastWidget extends StatelessWidget {
  const CustomToastWidget({Key? key, required this.msg}) : super(key: key);

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(msg, style: const TextStyle(color: Colors.white)),
      ),
    );
  }
}
