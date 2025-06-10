import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/controller/navigation_controller.dart';
import 'package:resume/widgets/global/appbar_widget.dart';
import 'package:resume/widgets/global/logo_widget.dart';
import 'package:resume/widgets/views/home/grid_card_widget.dart';

final NavigationController navigationController = NavigationController.to;

class ResumePage extends StatelessWidget {
  const ResumePage({super.key});
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
              children: [
                LogoWidget(),
                AppBarWidget(
                  title: "Resume Page",
                  backBottom: true,
                  imageIcon: "assets/reuomeh/personalcard.svg",
                  showThemeToggle: true,
                ),

                Expanded(child: GridCardWidget()),

                Positioned(
                  bottom: context.height * 0.115,
                  right: 16.0,
                  child: AnimatedPositioned(
                    duration: Duration(milliseconds: 1200),
                    curve: Curves.ease,
                    bottom: 0.0,
                    right: 16.0,
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: context
                          .theme
                          .floatingActionButtonTheme
                          .backgroundColor,
                      shape: StadiumBorder(),
                      onPressed: () {
                        navigationController.navToAddJobExperience();
                      },
                      child: Image.asset(
                        "assets/isIconOnly.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              ],
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