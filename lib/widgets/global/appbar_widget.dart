import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool backBottom;
  final void Function()? onPressed;
  final String? imageIcon;
  final bool isSearch;
  final TextEditingController? textController;
  const AppBarWidget({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.backBottom = true,
    this.imageIcon,
    this.isSearch = false,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:
            CrossAxisAlignment.center, // اضافه شده برای تراز عمودی
        children: [
          if (backBottom)
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppThemeColors.titleFieldTextcolor,
              ),
            ),

          // آیکون مستقیماً در Row قرار گرفته (بدون Column)
          if (imageIcon != null)
            Image.asset(imageIcon!, width: 16.0, height: 16.0)
          else
            Icon(icon, size: 16, color: AppThemeColors.titleFieldTextcolor),

          // فاصله کم بین آیکون و متن
          const SizedBox(width: 4),

          // متن بدون padding اضافی
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: AppThemeColors.titleFieldTextcolor,
            ),
          ),

          const Spacer(),

          Stack(
            children: [
              if (isSearch)
                isSearch
                    ? textController != null
                          ? Positioned(
                              right: 16,
                              top: 82,
                              child: SizedBox(
                                height: 24,
                                child: AnimSearchBar(
                                  width: context.width,
                                  textController: textController!,
                                  onSuffixTap: () {
                                    // عملکرد مورد نظر برای ضربه زدن روی پسوند
                                  },
                                  onSubmitted: (String value) {
                                    // عملکرد مورد نظر برای ارسال متن
                                  },
                                  color: Colors.black,
                                ).paddingOnly(right: 0),
                              ),
                            )
                          : SizedBox(
                              height: 24,
                              child: AnimSearchBar(
                                width: context.width * 0.80,
                                textController: TextEditingController(),
                                onSuffixTap: () {
                                  // عملکرد مورد نظر برای ضربه زدن روی پسوند
                                },
                                onSubmitted: (String value) {
                                  // عملکرد مورد نظر برای ارسال متن
                                },
                                color: Colors.white,
                              ).paddingOnly(right: 0),
                            )
                    : Text(""),
            ],
          ),
        ],
      ),
    ).marginOnly(top: 20, left: 16.0, right: 16.0, bottom: 20.0);
  }
}
