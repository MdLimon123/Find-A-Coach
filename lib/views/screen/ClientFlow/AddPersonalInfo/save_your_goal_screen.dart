import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

class SaveYourGoalScreen extends StatefulWidget {
  const SaveYourGoalScreen({super.key});

  @override
  State<SaveYourGoalScreen> createState() => _SaveYourGoalScreenState();
}

class _SaveYourGoalScreenState extends State<SaveYourGoalScreen> {
  final goalController = TextEditingController();
  final setNumberController = TextEditingController();
  final milestoneController = TextEditingController();
  final secondMilestoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "setYourCoachingGoals".tr, // Changed
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      fontSize: 30),
                ),
                SizedBox(height: 8),
                Text(
                  "defineWhatYouWantToAchieve".tr, // Changed
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4B5563)),
                ),
                SizedBox(height: 24),
                _headingText(translatedText: "goal".tr), // Changed
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: goalController,
                  hintText: 'enterYourGoal'.tr, // Changed
                ),
                SizedBox(height: 16),
                _headingText(translatedText: "numberOfMilestones".tr), // Changed
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: setNumberController,
                  hintText: 'setTheNumberOfMilestones'.tr, // Changed
                  keyboardType: TextInputType.number, // Good for numbers
                ),
                SizedBox(height: 16),
                _headingText(translatedText: "firstMilestone".tr), // Changed (was "1st Milestone")
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: milestoneController,
                  hintText: 'enterFirstMilestone'.tr,
                ),
                SizedBox(height: 16),
                _headingText(translatedText: "secondMilestone".tr),
                SizedBox(
                  height: 8,
                ),
                CustomTextField(
                  controller: secondMilestoneController,
                  hintText: 'enterSecondMilestone'.tr,
                ),
                SizedBox(
                  height: 130,
                ),
                CustomButton(
                    onTap: () {
                    },
                    text: "saveGoal".tr) // Changed
              ],
            ),
          ),
        ));
  }

  Widget _headingText({required String translatedText}) {
    return Text(
      translatedText, // Expects already translated text
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.bigTextColor,
        fontSize: 16,
      ),
    );
  }
}
