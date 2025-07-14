import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/bottom_navigation_controller.dart';
import 'package:resume/controller/home_controller.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/views/home/grid_card_widget.dart';

final NavigationController navigationController = NavigationController.to;
final bottomNavController = BottomNavigationController.to;
final HomeController homeController = HomeController.to;

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  @override
  void initState() {
    super.initState();
    // Update selected index based on where user came from
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeController.updateSelectedIndexFromNavigation(
        navigationController.currentIndex,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            width: context.width,
            height: context.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [LogoWidget(), GridCardWidget()],
            ),
          ),

          // Floating Action Button که با navigation bar جابجا می‌شود
          Obx(
            () => AnimatedPositioned(
              duration: const Duration(milliseconds: 1300),
              curve: Curves.easeInOutCubic,
              bottom: bottomNavController.isExpanded
                  ? bottomNavController.fabBottomPosition(context)
                  : bottomNavController.bottomNavBarTop.value,
              right: context.height * 0.022,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: AppThemeColors.addFabColor,
                shape: StadiumBorder(),
                onPressed: () {
                  navigationController.navToResumeExportPage();
                },
                child: SizedBox(
                  width: 48,
                  height: 48,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'CV',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                      Text(
                        'PDF',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Open Sans',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/*
  Widget _buildCVButton() {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFF1E3363),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('CV', style: TextStyleHelper.instance.cvButtonLargeOpenSans),
          Text('PDF', style: TextStyleHelper.instance.cvButtonSmallOpenSans),
        ],
      ),
    );
  }

*/