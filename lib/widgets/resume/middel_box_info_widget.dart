import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class MiddelBoxInfoWidget extends StatelessWidget {
  final String title;
  final List<Widget> cardInfoViews;
  final String description;

  const MiddelBoxInfoWidget({
    super.key,
    required this.title,
    required this.cardInfoViews,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 229,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: context.theme.colorScheme.onPrimary,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 3,
            spreadRadius: 1,
            blurStyle: BlurStyle.outer,
            color: Colors.grey.withValues(alpha: 0.5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: TextStyleHelper.title14W400RegularOpenSans,
          ).paddingOnly(top: 10),
          SizedBox(height: 5),

          Wrap(spacing: 5, runSpacing: 5, children: []),
          Text(
            "Descriptions",
            style: TextStyleHelper.body14W500MediumOpenSans,
          ).paddingOnly(top: 8.0),
          Container(
            width: 292,
            height: 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(251, 241, 239, 1),
                  Color.fromRGBO(252, 248, 248, 1),
                  Color.fromRGBO(249, 240, 240, 1),
                  Color.fromRGBO(252, 244, 243, 1),
                ],
              ),
            ),
            child: SelectableText(
              description,
              style: TextStyleHelper.body12W400RegularOpenSans.copyWith(
                color: Color.fromRGBO(153, 153, 153, 1),
              ),
            ),
          ),
        ],
      ).paddingOnly(left: 5.0, right: 5),
    );
  }
}
