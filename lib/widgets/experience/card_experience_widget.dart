import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/config/extentions/extension_on_flutter.dart';
import 'package:resume/widgets/global/card_box_widget.dart';

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
    return CardBoxWidget(
      height: context.height * 0.1,
      isBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              Offstage(
                offstage: !isOnline,
                child: Container(
                  width:context.height * 0.01,
                  height: context.height * 0.01,
                  margin: const EdgeInsets.only(left: 0.0, right: 3.0),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(19, 98, 52, 1),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              Text(
                title,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.title14W600RegularOpenSansDark.copyWith(
                        fontSize: 12.0.ssp,
                      )
                    : TextStyleHelper.title14W600RegularOpenSans.copyWith(
                        fontSize: 12.0.ssp,
                      ),
              ),
              Spacer(),
              Text(
                subtitle,
                style: context.theme.brightness == Brightness.dark
                    ? TextStyleHelper.title12W600RegularOpenSansDark
                    : TextStyleHelper.title12W600RegularOpenSans
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: index != null
                      ? changeColor(index!)
                      : Colors.transparent, // رنگ پس‌زمینه
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  typeState,
                  style: context.theme.brightness == Brightness.dark
                      ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                      : TextStyleHelper.label10W600SemiBoldOpenSans,
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
