import 'dart:convert';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientHome/client_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ClientSocialAuthController extends GetxController{

  final _dataController = Get.find<DataController>();

  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: ['email', 'profile']
  );



  RxBool googleLoading = false.obs;

  Future<void> signInWithGoogle() async {
    try{

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if(googleSignInAccount != null){
        final payload = {
          "application": "FCM",
          "email": googleSignInAccount.email,
          "full_name": googleSignInAccount.displayName,
          "google_id":googleSignInAccount.id,
          "google_image_url": googleSignInAccount.photoUrl,
        };

        final response = await ApiClient.postData(ApiConstant.clientGoogleLogIn, payload);
        final body = jsonDecode(response.body);
        if(response.statusCode == 200 || response.statusCode == 201){
          final data = body['data'];
          if(data != null){
            await PrefsHelper.setString(AppConstants.bearerToken, data['access_token']);
            await _dataController.setUserData(data);
            showCustomSnackBar(body['message'], isError: false);
            Get.to(()=> ClientHomeScreen());
          }else{
            showCustomSnackBar(body['message'], isError: true);
          }

        }else{
          return body['message'] ?? "Google Sign-In Failed";
        }

      }else{
        showCustomSnackBar("Google Sign-In Failed", isError: true);
      }

    }catch (e){

      debugPrint("Google Sign-In error : ${e.toString()}");

    }

  }

}