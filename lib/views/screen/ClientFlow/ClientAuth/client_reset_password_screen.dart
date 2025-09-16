import 'package:find_me_a_coach/controllers/clientController/client_auth_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientResetPasswordScreen extends StatefulWidget {
  const ClientResetPasswordScreen({super.key});

  @override
  State<ClientResetPasswordScreen> createState() => _ClientResetPasswordScreenState();
}

class _ClientResetPasswordScreenState extends State<ClientResetPasswordScreen> {
  final passwordTextController = TextEditingController();
  final confirmPasswordTextController = TextEditingController();

  final _clientAuthController = Get.put(ClientAuthController());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "resetPassword".tr), // Changed
      body: Form(
        key: _formKey,
        child: ListView(
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
                validator: (value){
                  if(value!.isEmpty){
                    return "enterYourPassword".tr;
                  }
                  return null;
                },
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
                validator: (value){
                  if(value!.isEmpty){
                    return "enterYourPassword".tr;
                  }
                  return null;
                },
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/lock.svg'),
                ),
                hintText: "reEnterYourPassword".tr,), // Changed

              SizedBox(height: 40,),
              Obx(
                  ()=> CustomButton(
                  loading: _clientAuthController.isResetPassLoading.value,
                    onTap: (){
                  if(_formKey.currentState!.validate()){
                    _clientAuthController.resetPassword(password: passwordTextController.text, confirmPassword: confirmPasswordTextController.text);
                  }
                }, text: "confirm".tr),
              ) // Changed
            ]
        ),
      ),
    );
  }
}

