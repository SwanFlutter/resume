import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/widgets/global/card_box.dart';

class CardAcadmicWidget extends StatelessWidget {
  final String title;
  final String degree;
  final String dateRange;
  final bool isOnline;
  final String university;
  final double height;
  final double width;
  const CardAcadmicWidget({
    super.key,
    required this.title,
    required this.degree,
    required this.dateRange,
    required this.isOnline,
    required this.university,
    this.height = 100.0,
    this.width = 100.0, required String subtitle,
  });
  @override
  Widget build(BuildContext context) {
    return CardBox(
      height: height,
      width: width,
      boxShadow: context.theme.brightness == Brightness.dark
          ? [resumeBoxShadowDark]
          : [resumeBoxShadow],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (isOnline)
                Container(
                  width: 10.0,
                  height: 10.0,
                  margin: const EdgeInsets.only(right: 6.0),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(19, 98, 52, 1),
                    shape: BoxShape.circle,
                  ),
                ),
              Text(
                title,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.title14W600RegularOpenSansDark.copyWith(fontSize: 13)
                    : TextStyleHelper.title14W600RegularOpenSans.copyWith(fontSize: 13),
              ),
              const Spacer(),
              Text(
                dateRange,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.body12W400RegularOpenSansDark.copyWith(fontSize: 12, fontWeight: FontWeight.w600)
                    : TextStyleHelper.body12W400RegularOpenSans.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
           const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                degree,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.body10W400RegularOpenSansDark.copyWith(fontSize: 11, fontWeight: FontWeight.w500)
                    : TextStyleHelper.body10W400RegularOpenSans.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                university.toUpperCase(),
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.body10W400RegularOpenSansDark.copyWith(fontSize: 11, fontWeight: FontWeight.w500)
                    : TextStyleHelper.body10W400RegularOpenSans.copyWith(fontSize: 11, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 16.0, vertical: 18.0),
    );
  }
}
