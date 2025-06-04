import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class CardAcadmicWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isOnline;
  final String stateSchool;
  final String school;
  final double height;
  final double width;
  const CardAcadmicWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isOnline,
    required this.stateSchool,
    this.height = 100.0,
    this.width = 100.0,
    required this.school,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Card.outlined(
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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

                SizedBox(width: 3.0),
                Text(title, style: TextStyleHelper.body12W400RegularOpenSans),
                Spacer(),
                Text(
                  subtitle,
                  style: TextStyleHelper.label10W600SemiBoldOpenSans,
                ),
              ],
            ),
            SizedBox(height: context.height * 0.012),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  stateSchool,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(4, 7, 14, 1),
                  ),
                ),

                Spacer(),
                Text(
                  school.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(4, 7, 14, 1),
                  ),
                ),
              ],
            ),
          ],
        ).paddingSymmetric(horizontal: 16.0, vertical: 12.0),
      ),
    );
  }
}
