import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.width,
      height: 56,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(254, 222, 230, 0.8),
            Color.fromRGBO(220, 240, 249, 0.8),
          ],
          stops: [0.2883, 0.8557],
        ),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo.png", width: 94, height: 31),
          Container(
            width: 93,
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(178, 178, 178, 0.0), // چپ نازک و محو
                  Color.fromRGBO(178, 178, 178, 1.0), // مرکز ضخیم
                  Color.fromRGBO(178, 178, 178, 0.0), // راست نازک و محو
                ],
                stops: [0.0, 0.5, 1.0], // تنظیم دقیق نقاط گرادیان
              ),
            ),
          ),
        ],
      ),
    );
  }
}
