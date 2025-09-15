import 'dart:convert';
import 'dart:io';

import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/save_your_goal_screen.dart';
import 'package:get/get.dart';

class SetupClientProfileController extends GetxController{

  var isLoading = false.obs;

  Rx<File?> clientProfileImage = Rx<File?>(null);


  Future<void> pickClientProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      clientProfileImage.value = pickedFile;
    }
  }


  /// Setup Client Profile
  Future<void> setupClientProfile({
    required String profileImagePath,
   required String fullName,
    required String age,
    required String location,
    required String bio,
    required String ethnicity,
    required String gender,
    required String sexualOrientation,
    required List<String> neurotypes,
    required String profession,
    required String socialMedia,
    required String interests,
    required String anythingElse,
    required List<bool> switches

})async{

    isLoading(true);

    List<MultipartBody> multipartBody = [];
    if(profileImagePath.isNotEmpty){
      multipartBody.add(MultipartBody('image', File(profileImagePath)));
    }

    final List<String> fieldOrder = [
      'age',
      'location',
      'bio',
      'ethnicity',
      'gender',
      'sexual_orientation',
      'neurotypes',
      'profession',
      'social_media_link',
      'interests_and_projects',
      'anything_else',

    ];

    /// build private fields ture means keep private if switch is false
    Map<String, bool> privateFields = {};

    for(int i =0; i< fieldOrder.length; i++){
      privateFields[fieldOrder[i]] = switches[i];
    }


    final Map<String, String> body = {
      "image": profileImagePath,
      "full_name": fullName,
      "age": age,
      "location": location,
      "bio": bio,
      "ethnicity": ethnicity,
      "gender": gender,
      "sexual_orientation": sexualOrientation,
      "neurotypes": jsonEncode(neurotypes),
      "profession": profession,
      "social_media_link": socialMedia,
      "interests_and_projects": interests,
      "anything_else": anythingElse,
      "private_fields": jsonEncode(privateFields),
    };
    
   // final response = await ApiClient.patchData(ApiConstant.addUserProfile, jsonEncode(body));
    final response = await ApiClient.patchMultipartData(ApiConstant.addUserProfile,
        body,
        multipartBody: multipartBody);
    
    if(response.statusCode == 200){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.to(()=> SaveYourGoalScreen());
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }

    isLoading(false);

  }

}