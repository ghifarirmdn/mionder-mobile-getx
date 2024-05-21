import 'package:flutter/material.dart';

import '../styles/app_colors.dart';

class MyDividerSwipeUp extends StatelessWidget {
  const MyDividerSwipeUp({
    super.key,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 90,
      height: height ?? 7,
      decoration: BoxDecoration(
        color: black200,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}
