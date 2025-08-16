import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/AllTabsScreen/past_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/AllTabsScreen/upcoming_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClientBookingController extends GetxController{

  var tabIndex = 0.obs;

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

}