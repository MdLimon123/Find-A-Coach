
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/save_your_goal_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientAuth/client_reset_password_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/client_booking_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientChat/client_inbox_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientCommunity/client_community_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientHome/client_home_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientSelectLanguage/client_select_language_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachChat/coach_inbox_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachCommunity/coach_community_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/coach_home_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachProfile/coach_profile_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachSessions/coach_session_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachSelectLanguage/coach_select_language_screen.dart';
import 'package:find_me_a_coach/views/screen/Splash/select_role_screen.dart';
import 'package:find_me_a_coach/views/screen/Splash/welcome_screen.dart';
import 'package:get/get.dart';


import '../views/screen/ClientFlow/FindCoach/AllSubScreen/client_coach_profile_screen.dart';
import '../views/screen/ClientFlow/FindCoach/find_coach_screen.dart';
import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String welcomeScreen="/welcome_screen";
  static String selectRole = "/select_role_screen";
  static String clientHomeScreen="/client_home_screen";
  static String clientBookingScreen="/client_booking_screen";
  static String findCoach="/find_coach_screen";
  static String clientCommunityScreen="/client_community_screen";
  static String clientInboxScreen="/client_inbox_screen";
  static String selectLanguage="/select_language_screen";
  static String coachSelectLanguage = "/coach_select_language_screen";
  static String coachHomeScreen = "/coach_home_screen";
  static String coachSessionScreen = "/coach_session_screen";
  static String coachCommunityScreen = "/coach_community_screen";
  static String coachInboxScreen = "/coach_inbox_screen";
  static String coachProfileScreen = "/coach_profile_screen";
  static String saveYourGoalScreen = "/save_your_goal_screen";
  static String resetPasswordScreen = "/reset_password_screen";



 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:welcomeScreen, page: ()=>const WelcomeScreen(),transition:Transition.noTransition),
    GetPage(name:selectRole, page: ()=>const SelectRoleScreen(),transition:Transition.noTransition),
    GetPage(name:clientHomeScreen, page: ()=>const ClientHomeScreen(),transition:Transition.noTransition),
    GetPage(name:findCoach, page: ()=>const FindCoachScreen(),transition:Transition.noTransition),
    GetPage(name:clientCommunityScreen, page: ()=>const ClientCommunityScreen(),transition: Transition.noTransition),
    GetPage(name:clientInboxScreen, page: ()=>const ClientInboxScreen(),transition: Transition.noTransition),
    GetPage(name:clientBookingScreen, page: ()=>const ClientBookingScreen(),transition: Transition.noTransition),
    GetPage(name:selectLanguage, page: ()=>const ClientSelectLanguageScreen(),transition: Transition.noTransition),
   GetPage(name: coachSelectLanguage, page: ()=>const CoachSelectLanguageScreen(),transition: Transition.noTransition),
   GetPage(name: coachHomeScreen, page: ()=>const CoachHomeScreen(),transition: Transition.noTransition),
   GetPage(name: coachSessionScreen, page: ()=>const CoachSessionScreen(),transition: Transition.noTransition),
   GetPage(name: coachCommunityScreen, page: ()=>const CoachCommunityScreen(),transition: Transition.noTransition),
   GetPage(name: coachInboxScreen, page: ()=>const CoachInboxScreen(),transition: Transition.noTransition),
   GetPage(name: coachProfileScreen, page: ()=>const CoachProfileScreen(),transition: Transition.noTransition),
   GetPage(name: saveYourGoalScreen, page: ()=>const SaveYourGoalScreen(),transition: Transition.noTransition),
   GetPage(name: resetPasswordScreen, page: ()=>const ClientResetPasswordScreen(),transition: Transition.noTransition),

  ];



}