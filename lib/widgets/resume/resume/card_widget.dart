import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:theme_master/theme_master.dart';

class CardWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Alignment begin;
  final Alignment end;
  final bool isSelected;

  const CardWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.begin,
    required this.end,
    this.isSelected = false,
  });

  double getFontSize(BuildContext context) {
    final double screenWidth = context.width;

    // Define breakpoints for different device types
    if (screenWidth < 600) {
      // Mobile devices
      return 12.0;
    } else if (screenWidth >= 600 && screenWidth < 900) {
      // Tablets
      return 14.0;
    } else if (screenWidth >= 900 && screenWidth < 1200) {
      // Laptops
      return 16.0;
    } else if (screenWidth >= 1200 && screenWidth < 1600) {
      // Desktops
      return 18.0;
    } else {
      // TVs and larger screens
      return 20.0;
    }
  }

  double getIconSize(BuildContext context) {
    final double fontSize = getFontSize(context);

    return fontSize * 2.4;
  }

  @override
  Widget build(BuildContext context) {
    final double cardWidth = context.width;
    final double cardHeight = context.height * 0.12;

    // Dynamic icon size and font size based on screen size
    final double iconSize = getIconSize(context);
    final double fontSize = getFontSize(context);
    final double spacing = context.height * 0.008; // Dynamic spacing

    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        boxShadow: context.theme.brightness == Brightness.dark
            ? [resumeBoxShadowDark]
            : [resumeBoxShadow],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: isSelected
              ? (context.theme.brightness == Brightness.dark
                    ? const Color.fromRGBO(253, 27, 81, 0.8)
                    : const Color.fromRGBO(253, 27, 81, 0.7))
              : context.getBorderColorByEnum(BorderColor.border1),
          width: 1.0,
        ),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: isSelected
              ? (context.theme.brightness == Brightness.dark
                    ? [
                        const Color.fromRGBO(253, 27, 81, 0.3),
                        const Color.fromRGBO(250, 27, 81, 0.2),
                      ]
                    : [
                        const Color.fromRGBO(255, 239, 243, 1),
                        const Color.fromRGBO(254, 223, 231, 1),
                      ])
              : context.cardGradientColors,
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
                color: isSelected
                    ? (context.theme.brightness == Brightness.dark
                          ? const Color.fromRGBO(253, 27, 81, 0.1)
                          : const Color.fromRGBO(254, 222, 230, 1))
                    : (context.theme.brightness == Brightness.dark
                          ? const Color.fromRGBO(255, 255, 255, 0.05)
                          : const Color.fromRGBO(255, 255, 255, 0.3)),
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
                  width: iconSize,
                  height: iconSize,
                  colorFilter: ColorFilter.mode(
                    (Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black),
                    BlendMode.srcIn,
                  ),
                ),
                SizedBox(height: spacing),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: (Theme.of(context).brightness == Brightness.dark
                      ? TextStyleHelper.body12W400RegularOpenSansDark.copyWith(
                          fontSize: fontSize,
                        )
                      : TextStyleHelper.body12W400RegularOpenSans.copyWith(
                          fontSize: fontSize,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/*class CardWidget extends StatelessWidget {
  final String icon;
  final String text;
  final Alignment begin;
  final Alignment end;
  final void Function()? onTap;

  const CardWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.begin,
    required this.end,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final double cardWidth = context.width * 0.4;
    final double cardHeight = context.height * 0.12;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12.0),
      child: Ink(
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
        child: InkWell(
          onTap: onTap,
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
        ),
      ),
    );
  }
}
*/
