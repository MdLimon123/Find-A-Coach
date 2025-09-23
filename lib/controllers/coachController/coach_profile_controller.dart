import 'dart:convert';
import 'dart:io';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/models/coachModel/coach_profile_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class CoachProfileController extends GetxController{

  Rxn<CoachProfileModel> coachProfile = Rxn<CoachProfileModel>();

  var isLoading = false.obs;

  final _dataController = Get.put(DataController());

  final changeLocationLoading = false.obs;


  Rx<File?> coachProfileEditImage = Rx<File?>(null);


  Future<void> pickCoachProfileEditImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      coachProfileEditImage.value = pickedFile;
    }
  }

  Future<void> fetchCoachProfile()async{

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.coachProfile);
    if(response.statusCode == 200){

      coachProfile.value = CoachProfileModel.fromJson(response.body['data']);

    }else{
      showCustomSnackBar(response.body['message'],isError: true);
    }
    isLoading(false);


  }


  Future<void> updateCoachProfileData({
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

      final json = response.body;
      await _dataController.setCoachData(json['data'] ?? {});
      showCustomSnackBar("Profile updated successfully", isError: false);
      Get.back();
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }

    isLoading(false);
  }


  Future<void> changeLocation({

    required String location,

  }) async {
    changeLocationLoading(true);

    final Map<String, String> body = {
      "location": location,
    };


    final response =
    await ApiClient.patchData(ApiConstant.addUserProfile, body);

    if (response.statusCode == 200 || response.statusCode == 201) {

      final json = response.body;
      await _dataController.setCoachData(json['data'] ?? {});
      showCustomSnackBar("Location updated successfully", isError: false);
      Get.back();
    } else {
      showCustomSnackBar(response.body['message'], isError: true);
    }

    changeLocationLoading(false);
  }

}