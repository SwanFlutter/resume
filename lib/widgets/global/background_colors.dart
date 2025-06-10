import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

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
              ? const Alignment(-0.7, 0.7) // 250.75deg برای dark theme
              : const Alignment(-0.8, 0.8), // 259.02deg برای light theme
          end: context.theme.brightness == Brightness.dark
              ? const Alignment(0.7, -0.7)
              : const Alignment(0.8, -0.8),
          colors: context.theme.brightness == Brightness.dark
              ? [
                  const Color(0xFF01161E), // #01161E - آبی تیره در پایین چپ
                  const Color(0xFF24030B), // #24030B - قرمز در بالا راست
                ]
              : [
                  const Color(0xFFFFFFFF), // #FFFFFF - سفید در پایین چپ
                  const Color(0xFFFEDEE6), // #FEDEE6 - صورتی در بالا راست
                ],
        ),
      ),
      child: context.theme.brightness == Brightness.dark
          ? child
          : Container(
              // White overlay با opacity 0.6
              decoration: const BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 0.6),
              ),
              child: child,
            ),
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
 */*/