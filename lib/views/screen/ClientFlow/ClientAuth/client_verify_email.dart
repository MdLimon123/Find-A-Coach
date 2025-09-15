import 'package:find_me_a_coach/controllers/clientController/client_auth_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/add_client_personal_info_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class ClientVerifyEmailScreen extends StatefulWidget {

  final String email;

  const ClientVerifyEmailScreen({super.key, required this.email});

  @override
  State<ClientVerifyEmailScreen> createState() => _ClientVerifyEmailScreenState();
}

class _ClientVerifyEmailScreenState extends State<ClientVerifyEmailScreen> {

  final _fromKey = GlobalKey<FormState>();
  final _clientController = Get.put(ClientAuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'verifyEmail'.tr), // Changed
      body: Form(
        key: _fromKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 191),
          children: [

            Text("A verification code was sent to your email. Please enter the code below.",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFF6B7280)
            ),),

            SizedBox(height: 24,),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFF4B5563),
              focusedBorderColor: Color(0xFF4B5563),
              enabledBorderColor: Color(0xFF4B5563),
              showFieldAsBox: true,
              filled: true,
              fieldWidth: 48,
              fieldHeight: 48,
              borderRadius: BorderRadius.circular(100),
              textStyle: TextStyle(fontSize: 18, color: Color(0xFF4B5563),
                  fontWeight: FontWeight.w600),
              fillColor: Color(0xFFFFFFFF),
              onCodeChanged: (String code) {

              },
              onSubmit: (String verificationCode) {
                _clientController.otp.value = verificationCode;
              },
            ),
            SizedBox(height: 24,),
            Obx(
                ()=> CustomButton(
                loading: _clientController.isOtpLoading.value,
                  onTap: (){

                if (_fromKey.currentState!.validate()) {
                  _clientController.emailVerification(email: widget.email);
                }

              },
                  text: "verify".tr),
            ), // Changed
            SizedBox(height: 8,),
            Center(
                child: RichText(
                    text: TextSpan(
                        text: "dontGetTheCode".tr, // Changed
                        style: TextStyle(color: AppColors.bigTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: "resend".tr, // Changed
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                            recognizer:  TapGestureRecognizer()
                              ..onTap = () {
                                // Add your navigation or action for Sign Up here
                              },
                          ),

                        ]))),
          ],
        ),
      ),
    );
  }
}