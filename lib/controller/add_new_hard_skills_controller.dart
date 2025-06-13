import 'package:get_x_master/get_x_master.dart';

class AddNewHardSkillsController extends GetXController {
  static AddNewHardSkillsController get to =>
      Get.smartFind<AddNewHardSkillsController>();

  final RxBool isExpanded = true.obs;

  final List<RxSet<String>> selectedSkillsRows = List.generate(
    3,
    (_) => <String>{}.obs,
  );
  final RxSet<String> selectedIndustrial = <String>{}.obs;
  final RxSet<String> selectedField = <String>{}.obs;

  void expanded() {
    isExpanded.value = !isExpanded.value;
  }

  void toggleSkill(int rowIndex, String skill) {
    if (selectedSkillsRows[rowIndex].contains(skill)) {
      selectedSkillsRows[rowIndex].remove(skill);
    } else {
      selectedSkillsRows[rowIndex].add(skill);
    }
  }

  void toggleIndustrial(String item) {
    if (selectedIndustrial.contains(item)) {
      selectedIndustrial.remove(item);
    } else {
      selectedIndustrial.add(item);
    }
  }

  void toggleField(String item) {
    if (selectedField.contains(item)) {
      selectedField.remove(item);
    } else {
      selectedField.add(item);
    }
  }

  final List<List<String>> skills = [
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
    ['Languages', 'Office', 'Natural resource jobs', 'Office'],
  ];

  final List<String> industrial = [
    'Software',
    'Technology',
    'Natural resource jobs',
    'Office',
  ];

  final List<String> field = [
    'Technology',
    'Software',
    'Natural resource jobs',
    'Office',
  ];
}
