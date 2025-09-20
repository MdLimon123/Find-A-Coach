import 'dart:convert';

import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/AddCoachPesonalInfo/add_coach_personal_info_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachAuth/coach_verify_email.dart';
import 'package:get/get.dart';

import '../../views/base/custom_snackbar.dart';

class CoachAuthController extends GetxController{

  var isLoading = false.obs;
  final isOtpLoading = false.obs;
  var otp = "".obs;

  Future<void> signUpInCoach({required String email, required String password, required String confirmPassword}) async {

    isLoading(true);

    final body = {
      "application": "FCM",
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "role": "user"
    };
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.clientSignUp, jsonEncode(body),
        headers: headers);

    if(response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(()=> CoachVerifyEmailScreen(email: email));
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isLoading(false);

  }

  Future<void> emailVerificationInCoach({required String email}) async {

    isOtpLoading(true);

    final body = {
      "email": email,
      "otp": otp.value
    };

    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.emailOtpVerification, jsonEncode(body),
        headers: headers);

    if(response.statusCode == 200){
      await PrefsHelper.setString(AppConstants.bearerToken, response.body['access_token']);
      showCustomSnackBar(response.body['message'], isError: false);

      Get.to(()=> AddCoachPersonalInfoScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isOtpLoading(false);

  }

}