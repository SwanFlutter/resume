import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:theme_master/theme_master.dart';

class CardWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Alignment begin;
  final Alignment end;

  const CardWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.begin,
    required this.end,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = context.width * 0.4;
    final double cardHeight = context.height * 0.12;

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        boxShadow: context.theme.brightness == Brightness.dark
            ? [resumeBoxShadowDark]
            : [resumeBoxShadow],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: context.getBorderColorByEnum(BorderColor.border1),
          width: 1.0,
        ),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: context.cardGradientColors,
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 0,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.3),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).brightness == Brightness.dark
                      ? TextStyleHelper.body12W400RegularOpenSansDark
                      : TextStyleHelper.body12W400RegularOpenSans,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
