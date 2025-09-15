import 'dart:io';

import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:get/get.dart';

class CoachProfileController extends GetxController{

  Rx<File?> coachProfileEditImage = Rx<File?>(null);


  Future<void> pickCoachProfileEditImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      coachProfileEditImage.value = pickedFile;
    }
  }

}