import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/widgets/global/card_box.dart';

class CardCoursesWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isOnline;
  final String stateSchool;
  final String timeSchool;
  final String school;
  const CardCoursesWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isOnline,
    required this.stateSchool,
    required this.timeSchool,
    required this.school,
  });
  @override
  Widget build(BuildContext context) {
    return CardBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isOnline
                  ? Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(19, 98, 52, 1),
                        shape: BoxShape.circle,
                      ),
                    )
                  : SizedBox.shrink(),
              SizedBox(width: 5.0),
              SvgPicture.asset(
                "assets/reuomeh/Academy.svg",
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  context.theme.brightness == Brightness.dark
                      ? Colors.white
                      : AppThemeColors.titleFieldTextcolor,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 5.0),
              Text(
                title,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                    : TextStyleHelper.label10W600SemiBoldOpenSans,
              ),
              Spacer(),
              Text(
                subtitle,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                    : TextStyleHelper.label10W600SemiBoldOpenSans,
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                stateSchool,
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  color: isOnline
                      ? Color.fromRGBO(19, 98, 52, 1)
                      : Color.fromRGBO(4, 7, 14, 1),
                ),
              ),

              SizedBox(
                height: 10.0,
                child: VerticalDivider(
                  color: Colors.pink,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  width: 20,
                ),
              ),
              Text(
                timeSchool,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                    : TextStyleHelper.label10W600SemiBoldOpenSans,
              ),
              Spacer(),
              Text(
                school.toUpperCase(),
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                    : TextStyleHelper.label10W600SemiBoldOpenSans,
              ),
            ],
          ),
        ],
      ).paddingAll(15.0),
    );
  }
}
