// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/theme_controller.dart';
import 'package:theme_master/theme_master.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool backBottom;
  final void Function()? onPressed;
  final String? imageIcon;
  final bool isSearch;
  final TextEditingController? textController;
  final bool showThemeToggle;
  const AppBarWidget({
    super.key,
    required this.title,
    this.icon,
    this.onPressed,
    this.backBottom = true,
    this.imageIcon,
    this.isSearch = false,
    this.textController,
    this.showThemeToggle = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      child: InkWell(
        onTap: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (backBottom)
              InkResponse(
                onTap: onPressed,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 18,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : AppThemeColors.titleFieldTextcolor,
                ),
              ),

            // آیکون مستقیماً در Row قرار گرفته (بدون Column)
            if (imageIcon != null)
              imageIcon!.endsWith('.svg')
                  ? SvgPicture.asset(
                      imageIcon!,
                      width: 16.0,
                      height: 16.0,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppThemeColors.titleFieldTextcolor,
                        BlendMode.srcIn,
                      ),
                    )
                  : Image.asset(
                      imageIcon!,
                      width: 16.0,
                      height: 16.0,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : AppThemeColors.titleFieldTextcolor,
                    )
            else
              Icon(
                icon,
                size: 16,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : AppThemeColors.titleFieldTextcolor,
              ),

            // فاصله کم بین آیکون و متن
            SizedBox(width: 4),
            // متن بدون padding اضافی
            Text(
              title,
              style: Theme.of(context).brightness == Brightness.dark
                  ? TextStyleHelper.title14W500RegularOpenSansDark
                  : TextStyleHelper.title14W500RegularOpenSans,
            ),

            const Spacer(),

            // Theme Toggle Button
            if (showThemeToggle)
              GetBuilder<ThemeControllers>(
                builder: (themeController) {
                  return InkWell(
                    onTap: () => themeController.toggleTheme(),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: context.cardGradientColors.first.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Icon(
                        Theme.of(context).brightness == Brightness.dark
                            ? Icons.light_mode
                            : Icons.dark_mode,
                        size: 16,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : AppThemeColors.titleFieldTextcolor,
                      ),
                    ),
                  );
                },
              ),

            if (showThemeToggle) const SizedBox(width: 8),

            Stack(
              alignment: Alignment.centerRight,
              children: [
                if (isSearch)
                  isSearch
                      ? SvgPicture.asset(
                          "assets/search-normal.svg",
                          width: 15,
                          height: 15,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white
                              : AppThemeColors.titleFieldTextcolor,
                        )
                      : SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    ).marginOnly(top: 20, left: 16.0, right: 16.0, bottom: 20.0);
  }
}
