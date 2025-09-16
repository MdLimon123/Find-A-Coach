import 'package:find_me_a_coach/controllers/clientController/setup_client_profile_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/add_milestone_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveYourGoalScreen extends StatefulWidget {
  const SaveYourGoalScreen({super.key});

  @override
  State<SaveYourGoalScreen> createState() => _SaveYourGoalScreenState();
}

class _SaveYourGoalScreenState extends State<SaveYourGoalScreen> {

  final goalController = TextEditingController();
  final _setupClientProfileController = Get.put(SetupClientProfileController());

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Form(
              key: _formKey,
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
                    validator: (value){
                      if(value!.isEmpty){
                        return 'enterYourGoal'.tr;
                      }
                      return null;
                    },
                    controller: goalController,
                    hintText: 'enterYourGoal'.tr, // Changed
                  ),
                  SizedBox(height: 16),
                  _headingText(translatedText: "numberOfMilestones".tr), // Changed
                  SizedBox(
                    height: 8,
                  ),
                  CustomTextField(
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Set The Number Of Milestones';
                      }
                      return null;
                    },
                    controller: _setupClientProfileController.setNumberController,
                    hintText: 'setTheNumberOfMilestones'.tr,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),

                  SizedBox(
                    height: 130,
                  ),
                  Obx(
                      ()=> CustomButton(
                        loading: _setupClientProfileController.isSetGoals.value,
                        onTap: () {
                          if(_formKey.currentState!.validate()){
                            _setupClientProfileController.setGoals(goal: goalController.text);
                          }
                        },
                        text: "Next".tr),
                  ) // Chan
                ],
              ),
            ),
          ),
        ));
  }

  Widget _headingText({required String translatedText}) {
    return Text(
      translatedText,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.bigTextColor,
        fontSize: 16,
      ),
    );
  }
}
