import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDiscussionScreen extends StatefulWidget {
  const CreateDiscussionScreen({super.key});

  @override
  State<CreateDiscussionScreen> createState() => _CreateDiscussionScreenState();
}

class _CreateDiscussionScreenState extends State<CreateDiscussionScreen> {
  final topicTextController = TextEditingController();
  final askTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "create_discussion".tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "topic".tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: topicTextController,
                      suffixIcon: Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColors.bigTextColor,
                      ),
                      hintText: 'select_topic'.tr,
                    ),
                    SizedBox(height: 16),
                    Text(
                      "write_your_post".tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                    SizedBox(height: 8),
                    CustomTextField(
                      controller: askTextController,
                      maxLines: 5,
                      minLines: null,
                      hintText: 'ask_a_question'.tr,
                    ),
                  ],
                ),
              ),
            ),
            CustomButton(
              onTap: () {},
              text: "post".tr,
            ),
          ],
        ),
      ),
    );
  }
}
