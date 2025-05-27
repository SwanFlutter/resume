import 'package:get_x_master/get_x_master.dart';

class ExperienceController extends GetXController {
  static ExperienceController get to => Get.smartFind<ExperienceController>();

  late String typeStat = "Course";
  late String title = "Ux Research";
  List<String> titleList = ["Ux Research", "Ux Design", "UI Design"];
  List<String> state = ["FullTime", "Contarct", "Apprenticeship", "Part-Time"];
}
