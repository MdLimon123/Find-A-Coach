import 'dart:convert';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/AddCoachPesonalInfo/add_coach_personal_info_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachAuth/coach_verify_email.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/coach_home_screen.dart';
import 'package:get/get.dart';

import '../../views/base/custom_snackbar.dart';

class CoachAuthController extends GetxController{

  var isLoading = false.obs;
  final isOtpLoading = false.obs;
  var otp = "".obs;
  var isLoginLoading = false.obs;

  final _dataController = Get.put(DataController());


/// coach login
  Future<void> login({required String email, required String password}) async {
    isLoginLoading(true);
    try {
      final body = {"email": email, "password": password};
      var headers = {'Content-Type': 'application/json'};

      final response = await ApiClient.postData(ApiConstant.clientLogin, jsonEncode(body), headers: headers);



      if (response.statusCode == 200 || response.statusCode == 201) {
        await PrefsHelper.setString(AppConstants.bearerToken, response.body['access_token'] ?? '');
        await _dataController.setCoachData(response.body['data'] ?? {});
        showCustomSnackBar(response.body['message'] ?? 'Login successful', isError: false);
        Get.to(() => CoachHomeScreen());
      } else {
        final error = response.body['message'] ?? 'Unexpected error';
        showCustomSnackBar(error, isError: true);
      }
    } catch (e) {
      showCustomSnackBar('Something went wrong', isError: true);
    } finally {
      isLoginLoading(false);
    }
  }


  /// coach signup
  Future<void> signUpInCoach({required String email, required String password, required String confirmPassword}) async {

    isLoading(true);

    final body = {
      "application": "FCM",
      "email": email,
      "password": password,
      "confirm_password": confirmPassword,
      "role": "coach"
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