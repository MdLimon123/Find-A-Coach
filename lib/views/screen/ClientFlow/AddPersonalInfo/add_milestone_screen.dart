import 'package:find_me_a_coach/controllers/clientController/setup_client_profile_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddMilestoneScreen extends StatefulWidget {
  final int totalMilestones;
  final int goalId;
  const AddMilestoneScreen({super.key, required this.totalMilestones,
  required this.goalId});

  @override
  State<AddMilestoneScreen> createState() => _AddMilestoneScreenState();
}

class _AddMilestoneScreenState extends State<AddMilestoneScreen> {

  final _setupClientProfileController = Get.put(SetupClientProfileController());

  late List<TextEditingController> controllers;

  @override
  void initState() {
    super.initState();

    controllers = List.generate(
      widget.totalMilestones,
          (_) => TextEditingController(),
    );
  }

  @override
  void dispose() {

    for (var c in controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Set Your Milestones",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 16),


              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.totalMilestones,
                itemBuilder: (context, index) {
                  final number = index + 1;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$number${_ordinalSuffix(number)} Milestone",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.bigTextColor,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controllers[index],
                          hintText: "Enter milestone $number",
                        ),
                      ],
                    ),
                  );
                },
              ),

              const SizedBox(height: 24),

              Obx(
                  ()=> CustomButton(
                  loading: _setupClientProfileController.isAddMilestone.value,
                    onTap: (){
                      final milestones = controllers.map((c)=> c.text.trim())
                      .where((t)=> t.isNotEmpty).toList();
                      _setupClientProfileController.addMilestones(milestones,
                      widget.goalId);
                    },
                    text: "Save"),
              )

            ],
          ),
        ),
      ),
    );
  }

  String _ordinalSuffix(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) return "th";
    switch (number % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }
}
