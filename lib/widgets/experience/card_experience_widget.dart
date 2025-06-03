import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/widgets/global/card_box.dart';

class CardExperienceWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final int? index;
  final bool isOnline;
  final String typeState;
  final String country;
  final String school;
  const CardExperienceWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isOnline,
    required this.typeState,
    required this.country,
    required this.school,
    this.index,
  });
  @override
  Widget build(BuildContext context) {
    return CardBox(
      child: Column(
        children: [
          Row(
            children: [
              Offstage(
                offstage: !isOnline,
                child: Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.only(left: 0.0, right: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(19, 98, 52, 1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(width: 0.0),
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
                style: TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(4, 7, 14, 1),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(
                  5,
                ), // این مقدار فاصله داخلی را تنظیم می‌کند
                decoration: BoxDecoration(
                  color: index != null
                      ? changeColor(index!)
                      : Colors.transparent, // رنگ پس‌زمینه

                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  typeState,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: AppThemeColors.colorFF0000,
                  ),
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
                country,
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
      ).paddingAll(16.0),
    );
  }

  Color changeColor(int index) {
    Color color = Colors.transparent; // Default color
    switch (index) {
      case 0:
        color = Color.fromRGBO(222, 225, 232, 0.4);
        break;
      case 1:
        color = Color.fromRGBO(23, 201, 100, 0.2);
        break;
      case 2:
        color = Color.fromRGBO(253, 27, 100, 0.2);
        break;
      case 3:
        color = Color.fromRGBO(23, 201, 100, 0.2);
        break;
      default:
        color = Colors.transparent; // Assign a default color
    }
    return color;
  }
}
