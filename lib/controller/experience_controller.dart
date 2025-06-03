import 'package:get_x_master/get_x_master.dart';

class ExperienceController extends GetXController {
  static ExperienceController get to => Get.smartFind<ExperienceController>();

  late String typeStat = "Course";
  late String title = "Full-Time";
  List<String> jobTypeList = [
    "Full-Time",
    "Contract",
    "Apprenticeship",
    "Part-Time",
  ];
  List<String> chooseList = ["choose", "Course", "Job Experience"];
  late String chooseType = "choose";
}
