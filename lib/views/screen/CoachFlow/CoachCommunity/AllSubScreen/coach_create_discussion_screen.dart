import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class CoachCreateDiscussionScreen extends StatefulWidget {
  const CoachCreateDiscussionScreen({super.key});

  @override
  State<CoachCreateDiscussionScreen> createState() => _CoachCreateDiscussionScreenState();
}

class _CoachCreateDiscussionScreenState extends State<CoachCreateDiscussionScreen> {

  final topicTextController = TextEditingController();
  final askTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Create Discussion"),
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
                    Text("Topic",
                    style: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w600,
                     color: Color(0xFF4B5563)
                    ),),
                    SizedBox(height: 8,),
                    CustomTextField(controller: topicTextController,
                    suffixIcon: Icon(Icons.keyboard_arrow_down,
                    color: AppColors.bigTextColor,),
                    hintText: 'Select Topic',),
                    SizedBox(height: 16,),
                    Text("Write your post",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563)
                      ),),
                    SizedBox(height: 8,),
                    CustomTextField(controller: topicTextController,
                      maxLines: 5,
                      minLines: null,
                      hintText: 'Ask a question....',),



                  ],

                ),
              ),
            ),

            CustomButton(onTap: (){},
                text: "Post")
          ],
        ),
      ),
    );
  }
}
