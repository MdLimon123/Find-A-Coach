

import 'package:find_me_a_coach/helpers/prefs_helper.dart';
import 'package:find_me_a_coach/helpers/route.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:get/get.dart';

import '../views/base/custom_snackbar.dart';


class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false})async{

    if(response.statusCode != 200){
      if(response.statusCode == 401) {
        await PrefsHelper.remove(AppConstants.bearerToken);
        Get.offAllNamed(AppRoutes.splashScreen);
      }else {
        showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);

      }

    }


  }
}