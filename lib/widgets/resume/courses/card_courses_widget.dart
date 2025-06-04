import 'package:flutter/material.dart';
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

              Icon(Icons.school, size: 16.0),
              SizedBox(width: 3.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(4, 7, 14, 1),
                ),
              ),
              Spacer(),
              Text(
                subtitle,
                style: TextStyleHelper.label10W600SemiBoldOpenSans,
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
      ).paddingAll(15.0),
    );
  }
}
