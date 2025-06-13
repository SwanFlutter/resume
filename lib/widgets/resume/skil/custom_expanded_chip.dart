import 'package:flutter/material.dart';
import 'package:get_x_master/get_x_master.dart';
import 'package:resume/config/constant.dart';
import 'package:resume/controller/add_new_hard_skills_controller.dart';
import 'package:resume/widgets/resume/skil/cutstom_chip.dart';

class CustomExpandedChip extends StatelessWidget {
  final String title;
  final bool isExpandedIcon;
  const CustomExpandedChip({
    super.key,
    required this.addNewHardSkillsController,
    this.title = "Skills",
    this.isExpandedIcon = true,
  });

  final AddNewHardSkillsController addNewHardSkillsController;

  @override
  Widget build(BuildContext context) {
    return MultiObx(
      observables: [
        addNewHardSkillsController.isExpanded,
        ...addNewHardSkillsController.selectedSkillsRows,
      ],
      builder: () {
        return AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOutCubic,
          height: addNewHardSkillsController.isExpanded.value
              ? context.height * 0.14
              : context.height * 0.07,
          decoration: BoxDecoration(
            color: context.theme.cardColor,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: context.theme.brightness == Brightness.dark
                ? [resumeBoxShadowDark]
                : [resumeBoxShadow],
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                // Fixed Row
                Row(
                  children: [
                    Text(
                      title,
                      style: context.theme.brightness == Brightness.dark
                          ? TextStyleHelper.label10W600SemiBoldOpenSansDark
                          : TextStyleHelper.label10W600SemiBoldOpenSans
                                .copyWith(color: Color.fromRGBO(33, 33, 33, 1)),
                    ),
                    Spacer(),
                    isExpandedIcon
                        ? InkResponse(
                            onTap: () => addNewHardSkillsController.expanded(),
                            child: Icon(
                              addNewHardSkillsController.isExpanded.value
                                  ? Icons.keyboard_arrow_up_outlined
                                  : Icons.keyboard_arrow_down_outlined,
                              color: AppThemeColors.gray,
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ).paddingSymmetric(horizontal: 8.0, vertical: 4.0),

                // Always show first row
                if (addNewHardSkillsController.skills.isNotEmpty)
                  Wrap(
                    spacing: 0.0,
                    runSpacing: 0.0,
                    children: addNewHardSkillsController.skills[0].map((skill) {
                      return CustomChip(
                        label: skill,
                        isSelected: addNewHardSkillsController
                            .selectedSkillsRows[0]
                            .contains(skill),
                        onTap: () =>
                            addNewHardSkillsController.toggleSkill(0, skill),
                      );
                    }).toList(),
                  ),

                // Expandable Rows (rows 2 and 3)
                if (addNewHardSkillsController.isExpanded.value &&
                    addNewHardSkillsController.skills.length > 1)
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: List.generate(
                        // Show remaining rows (max 2 more rows)
                        addNewHardSkillsController.skills.length > 3
                            ? 2
                            : addNewHardSkillsController.skills.length - 1,
                        (index) {
                          int rowIndex = index + 1; // Start from second row
                          return Wrap(
                            spacing: 0.0,
                            runSpacing: 0.0,
                            children: addNewHardSkillsController
                                .skills[rowIndex]
                                .map((skill) {
                                  return CustomChip(
                                    label: skill,
                                    isSelected: addNewHardSkillsController
                                        .selectedSkillsRows[rowIndex]
                                        .contains(skill),
                                    onTap: () => addNewHardSkillsController
                                        .toggleSkill(rowIndex, skill),
                                  );
                                })
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
