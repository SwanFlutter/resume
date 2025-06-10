import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:theme_master/theme_master.dart';

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
          begin: context.theme.brightness == Brightness.dark
              ? Alignment.topRight
              : Alignment.bottomLeft,
          end: context.theme.brightness == Brightness.dark
              ? Alignment.bottomLeft
              : Alignment.topRight,
          colors: context.scaffoldGradientColors,
        ),
      ),
      child: child,
    );
  }
}













/**class BackgroundColors extends StatelessWidget {
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
          colors: context.scaffoldGradientColors,
        ),
      ),
      child: child,
    );
  }
}













/**class BackgroundColors extends StatelessWidget {
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
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: Color.fromRGBO(255, 255, 255, 0.6), child: child),
        ],
      ),
    );
  }
}
 */