import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/screen/CoachFlow/CoachSessions/AllTabsScreen/request_screen.dart';
import '../../views/screen/CoachFlow/CoachSessions/AllTabsScreen/sessions_screen.dart';

class CoachSessionController extends GetxController{

  var tabIndex = 0.obs;

  List<String> tabList = [
    'Requests',
    'Sessions',
  ].obs;

  List<Widget> tabSections = [
    RequestScreen(),
    SessionsScreen(),
  ].obs;

  bool isTabSelected(int index){
    if(tabIndex == index){
      return true;
    }
    return false;
  }

}