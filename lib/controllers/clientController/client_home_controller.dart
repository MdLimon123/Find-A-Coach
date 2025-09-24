import 'dart:convert';

import 'package:find_me_a_coach/models/clientModel/client_feature_coach_model.dart';
import 'package:find_me_a_coach/models/clientModel/coach_category_home_model.dart';
import 'package:find_me_a_coach/models/clientModel/upcoming_session_home_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientChat/client_chat_screen.dart';
import 'package:get/get.dart';

class ClientHomeController extends GetxController{

  var isLoading = false.obs;

  var isCoachCategory = false.obs;
  var isFeatureLoading = false.obs;

  RxList<UpcomingSession> upcomingSessions = <UpcomingSession>[].obs;

  RxList<CoachCategory> coachCategories = <CoachCategory>[].obs;

  RxList<ClientFeatureCoachModel> clientFeatureCoach = <ClientFeatureCoachModel>[].obs;


  /// fetch upcoming sessions
  Future<void> fetchUpcomingSessions() async {

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.upcomingSessionsHome);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];

      if(data.isNotEmpty){
        final latest = data.last;
        upcomingSessions.value = [UpcomingSession.fromJson(latest)];
      }else{
        upcomingSessions.clear();
      }
    }else{
      showCustomSnackBar("Something we went wrong", isError: true);
    }
    isLoading(false);

  }

  /// fetch coach categories
Future<void> fetchCoachCategories() async {

    isCoachCategory(true);

    final response = await ApiClient.getData(ApiConstant.coachCategoryHome);

    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      coachCategories.value = data.map((e) => CoachCategory.fromJson(e)).toList();
    }else{
      showCustomSnackBar("Something we went wrong", isError: true);
    }
    isCoachCategory(false);

}

/// fetch featured coach
Future<void> fetchFeaturedCoach() async {

    isFeatureLoading(true);

    final response = await ApiClient.getData(ApiConstant.featuredCoach);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      clientFeatureCoach.value = data.map((e) => ClientFeatureCoachModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar("Something we went wrong", isError: true);
    }
    isFeatureLoading(false);
}

  var roomId = 0.obs;
  final isChatCreateLoading = false.obs;
  /// create first chat or room
  Future<void> createChat({required int id, required String name, required String image})async{

    isChatCreateLoading(true);
    final body = {
      "user2": id
    };

    final response = await ApiClient.postData(ApiConstant.createChatEndPoint, json.encode(body));

    if(response.statusCode == 200 || response.statusCode == 201){
      roomId.value = response.body["room_id"];
      Get.to(() => ClientChatScreen(id: roomId.value, name: name, image: image));
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isChatCreateLoading(false);

  }

}