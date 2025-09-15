import 'dart:io';

import 'package:find_me_a_coach/utils/image_utils.dart';
import 'package:get/get.dart';

class ClientProfileController extends GetxController{

  Rx<File?> clientProfileEditImage = Rx<File?>(null);


  Future<void> pickClientProfileEditImage({bool fromCamera = false})async{

    final pickedFile = await ImageUtils.pickAndCropImage(fromCamera: fromCamera);

    if(pickedFile != null){
      clientProfileEditImage.value = pickedFile;
    }
  }

}