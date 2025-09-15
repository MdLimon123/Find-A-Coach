import 'dart:convert';

import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/add_client_personal_info_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_otp_verify_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_verify_email.dart';
import 'package:get/get.dart';

class ClientAuthController extends GetxController{


  var isLoading = false.obs;
  var otp = "".obs;

  var isOtpLoading = false.obs;


  /// sign-up for client

  Future<void> signUp({required String email, required String password,
  required String confirmPassword}) async {

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
      Get.to(()=> ClientVerifyEmailScreen(email: email));
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isLoading(false);

  }

  /// email otp verification

  Future<void> emailVerification({required String email}) async {

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

      Get.to(()=> AddClientPersonalInfoScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isOtpLoading(false);

  }

}