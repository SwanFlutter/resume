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
    final double cardWidth = context.width * 0.4; 
    final double cardHeight =
        context.height * 0.12; // ارتفاع کارت 12% ارتفاع صفحه
    return Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        boxShadow: [resumeBoxShadow],
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: resumeCardColorBoeder),
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: resumeCardColor,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, width: 24, height: 24),
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
