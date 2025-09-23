import 'dart:convert';
import 'dart:io';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/models/clientModel/client_goal_model.dart';
import 'package:find_me_a_coach/models/clientModel/client_profile_model.dart';
import 'package:find_me_a_coach/models/clientModel/milestone_model.dart';
import 'package:find_me_a_coach/models/clientModel/save_coach_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:get/get.dart';

import '../../views/base/custom_snackbar.dart';

class ClientProfileController extends GetxController{

  Rx<File?> clientProfileEditImage = Rx<File?>(null);

  Rxn<ClientUser> clientProfile = Rxn<ClientUser>();

  RxList<Milestone> clientGoals = <Milestone>[].obs;
  RxList<MilestoneModel> clientMilestones = <MilestoneModel>[].obs;
  RxList<SaveCoachModel> savedCoach = <SaveCoachModel>[].obs;

  var isLoading = false.obs;

  final isMilestoneLoading = false.obs;

  final isProfileLoading = false.obs;

  final isGoalLoading = false.obs;

  final isUpdateLoading = false.obs;

  final isSaveCoachLoading = false.obs;

  var totalMilestones = 0.obs;
  var completedMilestones = 0.obs;

  var goalId = 0.obs;

  final _dataController = Get.put(DataController());


  void toggleMilestoneCompleted(int index, bool value) {
    final updated = clientMilestones[index].copyWith(isCompleted: value);
    clientMilestones[index] = updated;
  }


  Future<void> pickClientProfileEditImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      clientProfileEditImage.value = pickedFile;
    }
  }


  Future<void> updateClientProfile({
    required String profileImagePath,
    required String fullName,
    required String age,
    required String location,
    required String bio,
    required String ethnicity,
    required String gender,
    required String sexualOrientation,

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
      "profession": profession,
      "social_media_link": socialMedia,
      "interests_and_projects": interests,
      "anything_else": anythingElse,
      "private_fields": jsonEncode(privateFields),
    };

    final response = await ApiClient.patchMultipartData(ApiConstant.addUserProfile,
        body,
        multipartBody: multipartBody);

    if(response.statusCode == 200){
      final json = response.body;
      await _dataController.setUserData(json['data'] ?? {});
      showCustomSnackBar("Profile Update Successfully", isError: false);
      Get.back();
    }else{
      showCustomSnackBar('Something went wrong', isError: true);
    }

    isLoading(false);

  }

  Future<void> fetchProfile({required int id}) async {
    isProfileLoading(true);
    try {
      final response = await ApiClient.getData(
        ApiConstant.singleCoachProfile(id: id),
      );

      if (response.statusCode == 200) {
        final model = ClientProfileModel.fromJson(response.body);
        clientProfile.value = model.user;
      } else {
        showCustomSnackBar(response.body['message']);
      }
    } finally {
      isProfileLoading(false);
    }
  }

 Future<void> fetchAllGoal()async{

    isGoalLoading(true);
    final response = await ApiClient.getData(ApiConstant.goalsEndPoint);
    if(response.statusCode == 200){

      totalMilestones.value = response.body['data'][0]['total_milestones'];
      completedMilestones.value = response.body['data'][0]['completed_milestones'];
      goalId.value = response.body['data'][0]['id'];
      List<dynamic> data = response.body['data'];
      clientGoals.value = data.map((e) => ClientGoalModel.fromJson(e).milestones).expand((element) => element).toList();

    }else{
      showCustomSnackBar(response.body['message']);
    }
    isGoalLoading(false);

 }

 Future<void> fetchAllMilestones()async{

    isMilestoneLoading(true);
    final response = await ApiClient.getData(ApiConstant.getAllMilestonesEndPoint(id: goalId.value));
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      clientMilestones.value = data.map((e) => MilestoneModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message']);
    }
    isMilestoneLoading(false);

 }

  Future<void> updateMilestone(List<Map<String, dynamic>> milestones) async {
    isUpdateLoading(true);

    final body = {"milestones": milestones};

    final response = await ApiClient.patchData(ApiConstant.updateMilestoneEndPoint, body);

    if (response.statusCode == 200 || response.statusCode == 201) {
      showCustomSnackBar("Milestones updated successfully", isError: false);
      Get.back();
    } else {
      showCustomSnackBar("Something went wrong", isError: true);
    }

    isUpdateLoading(false);
  }

Future<void> fetchSaveCoach()async{

    isSaveCoachLoading(true);
    final response = await ApiClient.getData(ApiConstant.savedCoachEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      savedCoach.value = data.map((e) => SaveCoachModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isSaveCoachLoading(false);
}

}