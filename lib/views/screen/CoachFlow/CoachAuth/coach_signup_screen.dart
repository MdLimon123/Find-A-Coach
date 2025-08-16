import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_login_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_verify_email.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachAuth/coach_login_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachAuth/coach_verify_email.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


class CoachSignUPScreen extends StatefulWidget {
  const CoachSignUPScreen({super.key});

  @override
  State<CoachSignUPScreen> createState() => _CoachSignUPScreenState();
}

class _CoachSignUPScreenState extends State<CoachSignUPScreen> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 75),
        children: [
          Text("Set Up Your Account", // Changed
            style: TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w600,
                color: AppColors.bigTextColor
            ),),
          SizedBox(height: 24,),
          Text("email".tr, // Changed
            style: AppStyles.h2(
                color: AppColors.bigTextColor
            ),),
          SizedBox(height: 8,),
          CustomTextField(
            controller: emailTextController,
            isEmail: true,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset('assets/icons/email.svg'),
            ),
            hintText: 'enterYourEmail'.tr, // Changed
            filled: true,),
          SizedBox(height: 16,),
          Text("password".tr, // Changed
            style: AppStyles.h2(
                color: AppColors.bigTextColor
            ),),
          SizedBox(height: 8,),
          CustomTextField(controller: passwordTextController,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset('assets/icons/lock.svg'),
            ),
            hintText: 'enterYourPassword'.tr, // Changed
            filled: true,
            isPassword: true,
          ),

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
            hintText: "confirmPassword".tr,),

          SizedBox(height: 24,),
          CustomButton(onTap: (){
            Get.to(()=> CoachVerifyEmailScreen());
          },
              text: 'signIn'.tr), // Changed
          SizedBox(height: 36,),
          Row(
            children: [
              Expanded(child: Divider(color: Color(0xFF8AA8C9),)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text("orContinueWith".tr, // Changed
                  style: AppStyles.h5(
                      color: Color(0xFF6B7280),
                      fontWeight: FontWeight.w400
                  ),),
              ),
              Expanded(child: Divider(color: Color(0xFF8AA8C9),)),

            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: _customContainer(
                    image: 'assets/icons/google.svg',
                    onTap: (){}
                ),
              ),
              SizedBox(width: 24,),
              Expanded(
                child: _customContainer(
                    image: 'assets/icons/facebook.svg',
                    onTap: (){}
                ),
              ),
            ],
          ),
          SizedBox(height: 24,),
          Center(
              child: RichText(
                  text: TextSpan(
                      text: "alreadyHaveAnAccount".tr, // Changed
                      style: TextStyle(color: AppColors.bigTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: "signIn".tr, // Changed
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                          recognizer:  TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(()=> CoachLoginScreen());
                            },
                        ),

                      ]))),
        ],
      ),
    );
  }

  _customContainer({required String image, required Function()? onTap}) {
    return InkWell(
      onTap: onTap ,
      child:Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            border:Border.all(color: Color(0xFF5480B1), width: 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SvgPicture.asset(image,
            ),
          )),
    );
  }
}