import 'dart:io';

import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:get/get.dart';

class SetupCoachProfileController extends GetxController{

  Rx<File?> setupCoachProfile = Rx<File?>(null);


  Future<void> setupCoachProfileImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      setupCoachProfile.value = pickedFile;
    }
  }

}