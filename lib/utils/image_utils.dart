import 'dart:io';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';



class ImageUtils{

  static final ImagePicker _picker = ImagePicker();

  /// pick and crop image

 static Future<File?> pickAndCropImage({bool fromCamera = false})async{

   try{
     final pickedFile = await _picker.pickImage(
       source: fromCamera? ImageSource.camera : ImageSource.gallery,

     );

     if(pickedFile == null) return null;

    final CroppedFile? croppedFile = await ImageCropper().cropImage(
       sourcePath: pickedFile.path,

       uiSettings: [
         AndroidUiSettings(
           toolbarTitle: 'Cropper',
           toolbarColor: AppColors.primaryColor,
           toolbarWidgetColor: Colors.white,
           aspectRatioPresets: [
             CropAspectRatioPreset.original,
             CropAspectRatioPreset.square,

           ],
         ),
         IOSUiSettings(
           title: 'Cropper',
           aspectRatioPresets: [
             CropAspectRatioPreset.original,
             CropAspectRatioPreset.square,

           ],
         ),
       ],
     );

      if(croppedFile == null) return null;

      return File(croppedFile.path);

   }catch(e){
     debugPrint("Image Pick/Crop Error: $e");
     return null;
   }

 }

}