import 'package:flutter/material.dart';

class AnimatedThemeWrapper extends StatelessWidget {
  final Widget child;
  final ThemeMode themeMode;

  const AnimatedThemeWrapper({
    super.key,
    required this.child,
    required this.themeMode,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeInOutCubic,
      tween: Tween<double>(
        begin: 0.0,
        end: themeMode == ThemeMode.dark ? 1.0 : 0.0,
      ),
      builder: (context, animationValue, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubic,
          child: child,
        );
      },
    );
  }
}
