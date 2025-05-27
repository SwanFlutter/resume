import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class BackgroundColors extends StatelessWidget {
  final Widget? child;
  const BackgroundColors({super.key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: backgroundColors,
        ),
      ),
      child: child,
    );
  }
}
