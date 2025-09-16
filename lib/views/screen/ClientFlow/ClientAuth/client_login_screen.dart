import 'package:find_me_a_coach/controllers/clientController/client_auth_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_forget_password_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_signup_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientHome/client_home_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientLoginScreen extends StatefulWidget {
  const ClientLoginScreen({super.key});

  @override
  State<ClientLoginScreen> createState() => _ClientLoginScreenState();
}

class _ClientLoginScreenState extends State<ClientLoginScreen> {

  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final _clientAuthController = Get.put(ClientAuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 75),
          children: [
            Text("signInYourAccount".tr, // Changed
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
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Enter your email';
                }
                return null;
              },
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
            CustomTextField(
              controller: passwordTextController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter your password';
                } else if (value.length < 4) {
                  return 'Password must be at least 4 characters';
                }
                return null;
              },
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset('assets/icons/lock.svg'),
              ),
              hintText: 'enterYourPassword'.tr, // Changed
              filled: true,
              isPassword: true,
            ),
            SizedBox(height: 8,),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  Get.to(()=> ClientForgetPasswordScreen());
                },
                child: Text("forgetPassword".tr, // Changed
                  style: AppStyles.h5(
                      color: Color(0xFF00428A)
                  ),),
              ),
            ),
            SizedBox(height: 24,),
            Obx(
                ()=> CustomButton(
                loading: _clientAuthController.isLoginLoading.value,
                  onTap: (){
                  if (_formKey.currentState!.validate()) {
                  _clientAuthController.login(
                      email: emailTextController.text.trim(),
                      password: passwordTextController.text.trim());
                }
              },
                  text: 'signIn'.tr),
            ), // Changed
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
                        text: "dontHaveAnAccount".tr, // Changed
                        style: TextStyle(color: AppColors.bigTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                        children: [
                          TextSpan(
                            text: "signUp".tr, // Changed
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w700),
                            recognizer:  TapGestureRecognizer()
                              ..onTap = () {

                              Get.to(()=> ClientSignUPScreen());
                              },
                          ),

                        ]))),
          ],
        ),
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

