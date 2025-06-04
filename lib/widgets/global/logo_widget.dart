// ignore_for_file: unused_import

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/config/extentions/extension_on_flutter.dart';
//import 'package:get_x_master/get_x_master.dart';

class LogoWidget extends StatelessWidget {
  final TextEditingController? textController;
  final bool isSearch;

  const LogoWidget({super.key, this.textController, this.isSearch = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.width,
      height: context.height * 0.08,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: logoWidgetColor,
          stops: [0.2883, 0.8557],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(""),
          Column(
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
                      Color.fromRGBO(178, 178, 178, 0.0),
                      Color.fromRGBO(178, 178, 178, 1.0),
                      Color.fromRGBO(178, 178, 178, 0.0),
                    ],
                    stops: [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ],
          ),
          isSearch
              ? textController != null
                    ? AnimSearchBar(
                        width: context.width * 0.80,
                        textController: textController!,
                        onSuffixTap: () {
                          // عملکرد مورد نظر برای ضربه زدن روی پسوند
                        },
                        onSubmitted: (String value) {
                          // عملکرد مورد نظر برای ارسال متن
                        },
                        color: Colors.black,
                      ).paddingOnly(right: 0)
                    : AnimSearchBar(
                        width: context.width * 0.80,
                        textController: TextEditingController(),
                        onSuffixTap: () {
                          // عملکرد مورد نظر برای ضربه زدن روی پسوند
                        },
                        onSubmitted: (String value) {
                          // عملکرد مورد نظر برای ارسال متن
                        },
                        color: Colors.white,
                      ).paddingOnly(right: 0)
              : Text(""),
        ],
      ),
    );
  }
}
