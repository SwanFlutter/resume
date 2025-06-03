import 'package:get_x_master/get_x_master.dart';

class BottomNavigationController extends GetXController {
  static BottomNavigationController get to =>
      Get.smartFind<BottomNavigationController>();

  final RxBool _isExpanded = false.obs;
  bool get isExpanded => _isExpanded.value;

  void toggleExpand() {
    _isExpanded.value = !_isExpanded.value;
  }

  // محاسبه ارتفاع navigation bar
  double get navigationHeight => _isExpanded.value ? 161.0 : 63.0;

  // محاسبه موقعیت FAB (فاصله از پایین)
  double get fabBottomPosition => navigationHeight + 20.0;
  // Removed duplicate method fabBottomPosition to avoid naming conflict with getter.
}
