import 'package:find_me_a_coach/models/coachModel/coach_upcoming_session_model.dart';
import 'package:find_me_a_coach/models/coachModel/coach_user_booking_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class CoachHomeController extends GetxController{

  RxList<CoachUserBookingModel> coachUserBookingList = <CoachUserBookingModel>[].obs;
  RxList<CoachUpcomingSessionModel> coachUpcomingSessionList = <CoachUpcomingSessionModel>[].obs;

  final isLoading = false.obs;


  Future<void> fetchCoachUpcomingSession()async{
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.coachUpcomingSessionEndPoint);
    if(response.statusCode == 200){
      final Map<String, dynamic> body = response.body;
      final List<dynamic> data = body['data'] ?? [];
      coachUpcomingSessionList.value =
          data.map((e) => CoachUpcomingSessionModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isLoading(false);

  }

  Future<void> fetchCoachUserBooking() async {

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.coachBookAllUserEedPoint);
    if(response.statusCode == 200){
      final body = response.body;

      final List<dynamic> dataList = body['data'] as List<dynamic>;

      coachUserBookingList.value =
          dataList.map((e) => CoachUserBookingModel.fromJson(e)).toList();

    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isLoading(false);

  }

}