import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

class CardBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final List<BoxShadow>? boxShadow;
  const CardBox({
    super.key,
    this.height,
    this.width,
    this.child,
    this.boxShadow = const [
      BoxShadow(
        color: Color.fromRGBO(8, 14, 28, 0.3),
        spreadRadius: 0,
        blurRadius: 3,
        offset: Offset(0, 1),
      ),
    ],
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: boxShadow,
      ),
      child: child,
    );
  }
}

class CardBoxDynamic extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  const CardBoxDynamic({super.key, this.height, this.width, this.child});
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 1.seconds,
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(8, 14, 28, 0.3),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        child: AnimatedSwitcher(
          duration: 1.seconds,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation);
          },
          child: child,
        ),
      ),
    );
  }
}
