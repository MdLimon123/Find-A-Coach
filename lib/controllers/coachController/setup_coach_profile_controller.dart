import 'dart:convert';
import 'dart:io';

import 'package:find_me_a_coach/helpers/route.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:get/get.dart';

import '../../views/base/custom_snackbar.dart';

class SetupCoachProfileController extends GetxController{

  Rx<File?> setupCoachProfile = Rx<File?>(null);

  final isLoading = false.obs;


  Future<void> setupCoachProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      setupCoachProfile.value = pickedFile;
    }
  }


//   Future<void> setupCoachProfileData({
//     required String profileImagePath,
//     required String fullName,
//     required String age,
//     required String location,
//     required String bio,
//    required List<int> coachingAreas,
//     required List<int> subCoachingAreas,
//     required List<String> certifications,
//     required List<String> languagesSpoken,
//     String? personalWebsite,
//     String? linkedinProfile,
//     required String sessionFormat,
//     required Map<String, List<Map<String, String>>> availability,
//     required String pricePerSession,
//     required bool neurodiversityAffirming,
//     required bool genderSensitive,
//     required bool traumaSensitive,
//     required bool faithBased,
// })async{
//
//     String _normalizeUrl(String? url) {
//       if (url == null) return '';
//       final u = url.trim();
//       if (u.isEmpty) return '';
//       if (u.startsWith('http://') || u.startsWith('https://')) return u;
//       return 'https://$u';
//     }
//
//     isLoading(true);
//
//     List<MultipartBody> multipartBody = [];
//     if(profileImagePath.isNotEmpty){
//       multipartBody.add(MultipartBody('image', File(profileImagePath)));
//
//     }
//
//     final Map<String, String> body = {
//       "full_name": fullName,
//       "age": age,
//       "location": location,
//       "bio": bio,
//       "coaching_areas": jsonEncode(coachingAreas),
//       "sub_coaching_areas": jsonEncode(subCoachingAreas),
//       "certifications": jsonEncode(certifications),
//       "languages_spoken": jsonEncode(languagesSpoken),
//       if (_normalizeUrl(personalWebsite).isNotEmpty)
//         "personal_website": _normalizeUrl(personalWebsite),
//       if (_normalizeUrl(linkedinProfile).isNotEmpty)
//         "linkedin_profile": _normalizeUrl(linkedinProfile),
//       "session_format":
//       sessionFormat.toLowerCase() == "in-person" ? "in-person" : "virtual",
//       "availability": jsonEncode(availability),
//       "price_per_session": pricePerSession,
//       "neurodiversity_affirming": neurodiversityAffirming.toString(),
//       "gender_sensitive": genderSensitive.toString(),
//       "trauma_sensitive": traumaSensitive.toString(),
//       "faith_based": faithBased.toString(),
//     };
//
//     final response = await ApiClient.patchMultipartData(ApiConstant.addUserProfile, body, multipartBody: multipartBody);
//     if(response.statusCode == 200 || response.statusCode == 201){
//       showCustomSnackBar(response.body['message'], isError: false);
//       Get.offAllNamed(AppRoutes.coachHomeScreen);
//     }else{
//       showCustomSnackBar(response.body['message'], isError: true);
//
//     }
//     isLoading(false);
//
//   }


  Future<void> setupCoachProfileData({
    required String profileImagePath,
    required String fullName,
    required String age,
    required String location,
    required String bio,
    required List<int> coachingAreas,
    required List<int> subCoachingAreas,
    required List<String> certifications,
    required List<String> languagesSpoken,
    String? personalWebsite,
    String? linkedinProfile,
    required String sessionFormat,
    required Map<String, List<Map<String, String>>> availability,
    required String pricePerSession,
    required bool neurodiversityAffirming,
    required bool genderSensitive,
    required bool traumaSensitive,
    required bool faithBased,
  }) async {
    isLoading(true);

    List<MultipartBody> multipartBody = [];
    if (profileImagePath.isNotEmpty) {
      multipartBody.add(MultipartBody('image', File(profileImagePath)));
    }

    final Map<String, String> body = {
      "full_name": fullName,
      "age": age,
      "location": location,
      "bio": bio,
      "certifications": jsonEncode(certifications),
      "languages_spoken": jsonEncode(languagesSpoken),
      "session_format":
      sessionFormat.toLowerCase() == "in-person" ? "in-person" : "virtual",
      "availability": jsonEncode(availability),
      "price_per_session": pricePerSession,
      "neurodiversity_affirming": neurodiversityAffirming.toString(),
      "gender_sensitive": genderSensitive.toString(),
      "trauma_sensitive": traumaSensitive.toString(),
      "faith_based": faithBased.toString(),
    };

    if (personalWebsite?.isNotEmpty ?? false) {
      body['personal_website'] = personalWebsite!;
    }
    if (linkedinProfile?.isNotEmpty ?? false) {
      body['linkedin_profile'] = linkedinProfile!;
    }


    for (final id in coachingAreas) {
      body['coaching_areas[]'] = id.toString();
    }


    for (final id in subCoachingAreas) {
      body['sub_coaching_areas[]'] = id.toString();
    }

    final response =
    await ApiClient.patchMultipartData(ApiConstant.addUserProfile, body,
        multipartBody: multipartBody);

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar(response.body['message'], isError: false);
      Get.offAllNamed(AppRoutes.coachHomeScreen);
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }

    isLoading(false);
  }






}