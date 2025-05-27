import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/navigation_controller.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool backBottom;
  const AppbarWidget({
    super.key,
    required this.title,
    this.icon = Icons.badge_outlined,
    this.backBottom = true,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 30.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          backBottom
              ? IconButton(
                  onPressed: () {
                    final navigationController = NavigationController.to;
                    // اگر در صفحات فرعی Resume هستیم، برگرد به Resume Page
                    if (navigationController.currentIndex >= 6 &&
                        navigationController.currentIndex <= 11) {
                      navigationController
                          .navigateToResume(); // برگشت به Resume Page
                    } else {
                      // در غیر این صورت از Get.back استفاده کن
                      Get.back();
                    }
                  },
                  icon: Icon(Icons.arrow_back_ios, size: 24),
                )
              : SizedBox.shrink(),
          SizedBox(width: 5.0),
          Icon(icon, size: 22).paddingOnly(top: 5.0),
          SizedBox(width: 5.0),
          Text(
            title,
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
          ).paddingOnly(top: 8.0),
        ],
      ),
    ).marginOnly(top: 20, left: 16.0, right: 16.0, bottom: 20.0);
  }
}
