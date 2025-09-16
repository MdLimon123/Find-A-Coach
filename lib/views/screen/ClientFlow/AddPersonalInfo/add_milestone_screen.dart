import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class AddMilestoneScreen extends StatefulWidget {
  final int totalMilestones;     // <-- SaveYourGoalScreen থেকে সংখ্যা আসবে
  const AddMilestoneScreen({super.key, required this.totalMilestones});

  @override
  State<AddMilestoneScreen> createState() => _AddMilestoneScreenState();
}

class _AddMilestoneScreenState extends State<AddMilestoneScreen> {
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
                          "${number}${_ordinalSuffix(number)} Milestone",
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
              CustomButton(
                text: "Save",
                onTap: () {

                },
              ),
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
