import 'dart:convert';

import 'package:find_me_a_coach/models/clientModel/client_booking_details_model.dart';
import 'package:find_me_a_coach/models/clientModel/client_past_session_model.dart';
import 'package:find_me_a_coach/models/clientModel/client_upcoming_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/AllTabsScreen/past_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/AllTabsScreen/upcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientBookingController extends GetxController{

  var tabIndex = 0.obs;

   final cancelLoading = false.obs;
   final isReviewSubmitted = false.obs;

   RxInt rating = 0.obs;

  final upcomingLoading = false.obs;
  final pastSessionLoading = false.obs;

  final bookingDetailsLoading = false.obs;

  RxList<ClientUpcomingList> upcomingList = <ClientUpcomingList>[].obs;
  RxList<ClientPastSessionModel> passSessionList = <ClientPastSessionModel>[].obs;
  RxList<ClientBookingDetailsModel> bookingDetailsList = <ClientBookingDetailsModel>[].obs;


  List<String> tabList = [
    'Upcoming',
    'Past',
  ].obs;

  List<Widget> tabSections = [
   UpcomingScreen(),
    PastScreen(),
  ].obs;

  bool isTabSelected(int index){
    if(tabIndex == index){
      return true;
    }
    return false;
  }


  Future<void> fetchUpcomingSessions() async {

    upcomingLoading(true);

    final response = await ApiClient.getData(ApiConstant.upcomingSessionEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      List<dynamic> data = response.body['data'];
      upcomingList.value = data.map((e) => ClientUpcomingList.fromJson(e)).toList();

    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    upcomingLoading(false);

  }

  Future<void> fetchPastSessions() async {

    pastSessionLoading(true);

    final response = await ApiClient.getData(ApiConstant.pastSessionEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      List<dynamic> data = response.body['data'];
      passSessionList.value = data.map((e) => ClientPastSessionModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    pastSessionLoading(false);

  }

  Future<void> fetchBookingDetails(int id) async {

    bookingDetailsLoading(true);

    final response = await ApiClient.getData(ApiConstant.bookingDetailsEndPoint(id: id));
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      bookingDetailsList.value = data.map((e) => ClientBookingDetailsModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    bookingDetailsLoading(false);

  }

  Future<void> cancelBooking(int id) async {

    cancelLoading(true);

    final body = {
      "status": "canceled"
    };

    final response = await ApiClient.patchData(ApiConstant.statusChangeEndPoint(id: id), body);
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.back();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    cancelLoading(false);

  }

  Future<void> submitReview(int id, int rating) async {

    isReviewSubmitted(true);

    final body = {
      "session": id,
      "rating": rating
    };

    final response = await ApiClient.postData(ApiConstant.leaveReviewEndPoint, body);
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.back();
    }else{
      showCustomSnackBar(response.body['message'], isError: true);

    }
    isReviewSubmitted(false);

  }

}