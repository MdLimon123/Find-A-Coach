import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/helpers/route.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final _dataController = Get.put(DataController());

  @override
  void initState() {

    _loadUserRoleAndNavigate();

    super.initState();
  }

  Future<void> _loadUserRoleAndNavigate() async {
    await _dataController.getUserData();
    print("user id=============> ${_dataController.id.value}");
    print("user role=============> ${_dataController.role.value}");

    var token = await PrefsHelper.getString(AppConstants.bearerToken);
    if (token.isNotEmpty) {
      if (_dataController.role.value == "user") {
        Get.offAndToNamed(AppRoutes.clientHomeScreen);
      } else if (_dataController.role.value == "coach") {
        Get.offAndToNamed(AppRoutes.coachHomeScreen);
      } else {
        Get.offAndToNamed(AppRoutes.welcomeScreen);
      }
    } else {
      Get.offAndToNamed(AppRoutes.welcomeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Image.asset('assets/images/app_logo.png'),
      )
    );
  }
}
