import 'dart:convert';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/add_client_personal_info_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_login_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_otp_verify_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_reset_password_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_verify_email.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientHome/client_home_screen.dart';
import 'package:get/get.dart';

class ClientAuthController extends GetxController{


  var isLoading = false.obs;
  var otp = "".obs;
  var isOtpLoading = false.obs;
  var isEmailForgetLoading = false.obs;
  var isLoginLoading = false.obs;
  var isSendOTPLoading = false.obs;

  var isResetPassLoading = false.obs;

  final _dataController = Get.put(DataController());

  /// loing for client

  Future<void> login({required String email, required String password}) async {

    isLoginLoading(true);

    final body = {
      "email": email,
      "password": password
    };
    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.clientLogin, jsonEncode(body),
    headers: headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = response.body;
      await PrefsHelper.setString(AppConstants.bearerToken, json['access_token'] ?? '');
      await _dataController.setUserData(json['data'] ?? {});
      showCustomSnackBar(json['message'] ?? 'Login successful', isError: false);
      Get.to(() => ClientHomeScreen());
    } else {
      final error = response.body?['message'] ?? 'Unexpected error';
      showCustomSnackBar(error, isError: true);
    }

    isLoginLoading(false);
  }

  /// sign-up for client

  Future<void> signUp({required String email, required String password, required String confirmPassword}) async {

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

  /// send otp for forget password

   Future<void> sendOTPForForget({required String email}) async {

    isSendOTPLoading(true);

    final body = {
      "email": email
    };

    var headers = {
      'Content-Type': 'application/json',
    };

    final response = await ApiClient.postData(ApiConstant.sendOTP, jsonEncode(body),
    headers: headers);
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(()=> ClientOtpVerifyScreen(email: email));
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isSendOTPLoading(false);

   }

  Future<void> emailForgetVerification({required String email}) async {

    isEmailForgetLoading(true);

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

      Get.to(()=> ClientResetPasswordScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isEmailForgetLoading(false);

  }

  Future<void> resetPassword({required String password, required String confirmPassword}) async {

    isResetPassLoading(true);

    final body = {
      "password": password,
      "confirm_password": confirmPassword
    };

    final response = await ApiClient.postData(ApiConstant.resetPassword, jsonEncode(body));

    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(()=> ClientLoginScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isResetPassLoading(false);

  }


}