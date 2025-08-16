import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_login_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachAuth/coach_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Import GetX

class CoachResetPasswordScreen extends StatefulWidget {
  const CoachResetPasswordScreen({super.key});

  @override
  State<CoachResetPasswordScreen> createState() => _CoachResetPasswordScreenState();
}

class _CoachResetPasswordScreenState extends State<CoachResetPasswordScreen> {
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "resetPassword".tr), // Changed
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 191),
          children: [
            Text("newPassword".tr, // Changed
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B5563)
              ),),
            SizedBox(height: 8,),
            CustomTextField(controller: passwordTextController,
              filled: true,
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/lock.svg'),
              ),
              hintText: "enterNewPassword".tr,), // Already .tr in your snippet
            SizedBox(height: 16,),
            Text("confirmPassword".tr, // Changed
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B5563)
              ),),
            SizedBox(height: 8,),
            CustomTextField(controller: confirmPasswordTextController,
              filled: true,
              isPassword: true,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/lock.svg'),
              ),
              hintText: "reEnterYourPassword".tr,), // Changed

            SizedBox(height: 40,),
            CustomButton(onTap: (){
              Get.to(()=> CoachLoginScreen());
            }, text: "confirm".tr) // Changed
          ]
      ),
    );
  }
}

