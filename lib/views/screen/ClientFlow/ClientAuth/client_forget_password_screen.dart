import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class ClientForgetPasswordScreen extends StatefulWidget {
  const ClientForgetPasswordScreen({super.key});

  @override
  State<ClientForgetPasswordScreen> createState() => _ClientForgetPasswordScreenState();
}

class _ClientForgetPasswordScreenState extends State<ClientForgetPasswordScreen> {

  final emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Forget Password'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email",
            style: AppStyles.h3(
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563)
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
            SizedBox(height: 24,),
            CustomButton(onTap: (){},
                text: "sendOTP".tr)
          ],
        ),
      ),
    );
  }
}
