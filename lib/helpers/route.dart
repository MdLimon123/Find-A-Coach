
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/profile_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientChat/client_inbox_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientCommunity/client_community_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Home/client_home_screen.dart';
import 'package:find_me_a_coach/views/screen/Splash/welcome_screen.dart';
import 'package:get/get.dart';


import '../views/screen/ClientFlow/FindCoach/find_coach_screen.dart';
import '../views/screen/Splash/splash_screen.dart';

class AppRoutes{

  static String splashScreen="/splash_screen";
  static String welcomeScreen="/welcome_screen";
  static String clientHomeScreen="/client_home_screen";
  static String clientBookingScreen="/client_booking_screen";
  static String findCoach="/find_coach_screen";
  static String clientCommunityScreen="/client_community_screen";
  static String clientInboxScreen="/client_inbox_screen";



 static List<GetPage> page=[
    GetPage(name:splashScreen, page: ()=>const SplashScreen()),
    GetPage(name:welcomeScreen, page: ()=>const WelcomeScreen(),transition:Transition.noTransition),
    GetPage(name:clientHomeScreen, page: ()=>const ClientHomeScreen(),transition:Transition.noTransition),
    GetPage(name:findCoach, page: ()=>const FindCoachScreen(),transition:Transition.noTransition),
    GetPage(name:clientCommunityScreen, page: ()=>const ClientCommunityScreen(),transition: Transition.noTransition),
    GetPage(name:clientInboxScreen, page: ()=>const ClientInboxScreen(),transition: Transition.noTransition),
    GetPage(name:clientBookingScreen, page: ()=>const ClientBookingScreen(),transition: Transition.noTransition),
  ];



}