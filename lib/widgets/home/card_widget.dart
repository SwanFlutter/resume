import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

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
    return Container(
      width: 140,
      height: context.height * 0.12,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5), // رنگ سایه
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Color.fromRGBO(253, 27, 81, 0.2)),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [Colors.white, Color.fromRGBO(254, 222, 230, 1)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          SizedBox(height: 4),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyleHelper.body12W400RegularOpenSans,
          ),
        ],
      ),
    );
  }
}
