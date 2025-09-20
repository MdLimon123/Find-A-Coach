import 'dart:io';

import 'package:find_me_a_coach/controllers/clientController/client_profile_controller.dart';
import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_switch.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {

  final _dataController = Get.put(DataController());

  void updateData(){

    nameController.text = _dataController.name.value;
    ageController.text = int.parse(_dataController.age.value.toString()).toString();
    locationController.text = _dataController.location.value;
    bioController.text = _dataController.bio.value;
    ethnicitySelfDescribeController.text = _dataController.ethnicity.value;
    genderSelfDescribeController.text = _dataController.gender.value;
    sexualOrientationSelfDescribeController.text = _dataController.sexualOrientation.value;
    professionController.text = _dataController.profession.value;
    socialMediaController.text = _dataController.socialMediaLink.value;
    interestsController.text = _dataController.interestsAndProjects.value;
    anythingElseController.text = _dataController.anythingElse.value;

  }

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final bioController = TextEditingController();
  final ethnicitySelfDescribeController = TextEditingController();
  final genderSelfDescribeController = TextEditingController();
  final sexualOrientationSelfDescribeController = TextEditingController();
  final professionController = TextEditingController();
  final socialMediaController = TextEditingController();
  final interestsController = TextEditingController();
  final anythingElseController = TextEditingController();

  final _clientProfileController = Get.put(ClientProfileController());


  List<bool> isSwitched = List.generate(11, (_) => false);

  String? selectedValue;
  String? selectedGender;
  String? selectedSexual;

  final List<String> ethnicityOptionKeys = [
    "americanIndianOrAlaskanNative",
    "asianOrPacificIslander",
    "blackOrAfricanAmerican",
    "hispanic",
    "whiteOrCaucasian",
    "preferToSelfDescribeBelow",
  ];

 final Map<String, bool> _checkboxValues = {
    'neurotypical': false,
    'adhd': false,
    'audhd': false,
    'autistic': false,
    'dyscalculic': false,
    'dysgraphic': false,
    'dyslexic': false,
    'dyspraxic': false,
    'hyperlexic': false,
    'ocd': false,
    'spd': false,
    'synesthesia': false,
    'tourettes': false,
    'iDontKnow': false,
  };

  final List<String> genderOptionKeys = [
    "man",
    "woman",
    "nonBinary",
    "preferToSelfDescribeBelow"
  ];

  final List<String> sexualOrientationOptionKeys = [
    "asexual",
    "bisexual",
    "gay",
    "lesbian",
    "pansexual",
    "queer",
  ];

  @override
  void initState() {
    super.initState();
    _dataController.getUserData().then((_) {

      updateData();
    });
    selectedValue = "preferToSelfDescribeBelow".tr;
    selectedGender = "man".tr;
    selectedSexual = "asexual".tr;
  }

  Widget _headingText({required String translatedText}) {
    return Text(
      translatedText,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.bigTextColor,
        fontSize: 16,
      ),
    );
  }

  Widget _subHeadingText({required String translatedText}) {
    return Text(
      translatedText,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        color: AppColors.bigTextColor,
        fontSize: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Edit Profile"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Obx(
                      ()=> Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 144,
                        width: 144,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFFFFF),
                          border: Border.all(color: Color(0xFF8DA9D4)),
                        ),
                        child: ClipOval(
                          child:  _clientProfileController.clientProfileEditImage.value != null? Image.file(_clientProfileController.clientProfileEditImage.value!,
                            fit: BoxFit.cover,
                            height: 90,
                            width: 90,): CustomNetworkImage(
                              imageUrl: "${ApiConstant.imageBaseUrl}${_dataController.profileImage.value}",
                              height: 90,
                              width: 90),
                        ),
                      ),
                      Positioned(
                          bottom: 10,
                          right: 5,
                          child: InkWell(
                            onTap: (){
                              _clientProfileController.pickClientProfileEditImage(fromCamera: false);
                            },
                            child: Container(
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                color: Color(0xFF4F46E5),
                                shape: BoxShape.circle,
                                border: Border.all(color: Color(0xFFEEF5FD)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: SvgPicture.asset('assets/icons/edit.svg'),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(child: Text("Change Photo",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.bigTextColor,
                  fontSize: 14,
                ),),),
              SizedBox(height: 24),
              _headingText(translatedText: "fullName".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: nameController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/person.svg'),
                ),
                filled: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "age".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[0],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[0] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: ageController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/refresh.svg'), // Consider different icon
                ),
                filled: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "location".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[1],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[1] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: locationController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/refresh.svg'), // Consider different icon
                ),
                filled: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "bio".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[2],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[2] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: bioController,
                filled: true,
                minLines: 3,
                maxLines: 5,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "whatsYourEthnicity".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[3],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[3] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              Column(
                  children: ethnicityOptionKeys.map((optionKey) {
                    return RadioListTile<String>(
                      value: optionKey.tr,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      title: Text(
                        optionKey.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.bigTextColor),
                      ),
                      activeColor: AppColors.primaryColor,
                    );
                  }).toList()),
              SizedBox(height: 12),
              // if (selectedValue == "preferToSelfDescribeBelow".tr)
              CustomTextField(
                controller: ethnicitySelfDescribeController,
                filled: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "selectYourGender".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[4],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[4] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              Column(
                  children: genderOptionKeys.map((genderKey) {
                    return RadioListTile<String>(
                      value: genderKey.tr,
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value;
                        });
                      },
                      title: Text(
                        genderKey.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.bigTextColor),
                      ),
                      activeColor: AppColors.primaryColor,
                    );
                  }).toList()),
              SizedBox(height: 8),
              //if (selectedGender == "preferToSelfDescribeBelow".tr)
              CustomTextField(
                controller: genderSelfDescribeController,
                filled: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "sexualOrientation".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[5],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[5] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              Column(
                  children: sexualOrientationOptionKeys.map((sexualKey) {
                    return RadioListTile<String>(
                      value: sexualKey.tr,
                      groupValue: selectedSexual,
                      onChanged: (value) {
                        setState(() {
                          selectedSexual = value;
                        });
                      },
                      title: Text(
                        sexualKey.tr,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.bigTextColor),
                      ),
                      activeColor: AppColors.primaryColor,
                    );
                  }).toList()),
              SizedBox(height: 12),

              CustomTextField(
                controller: sexualOrientationSelfDescribeController,
                filled: true,
              ),

              SizedBox(height: 20),
              // Row(
              //   children: [
              //     _headingText(translatedText: "whatsYourNeurotype".tr),
              //     Spacer(),
              //     _subHeadingText(translatedText: "public".tr),
              //     SizedBox(width: 4),
              //     CustomSwitch(
              //         value: isSwitched[6],
              //         onChanged: (value) {
              //           setState(() {
              //             isSwitched[6] = value;
              //           });
              //         })
              //   ],
              // ),
              // SizedBox(height: 8),
              // Column(
              //   children: _checkboxValues.keys.map((String key) {
              //     return CheckboxListTile(
              //       title: Text(
              //         key.tr,
              //         style: AppStyles.h3(color: AppColors.fillTextColor), // Ensure AppStyles.h3 is defined
              //       ),
              //       value: _checkboxValues[key],
              //       onChanged: (bool? value) {
              //         setState(() {
              //           _checkboxValues[key] = value!;
              //         });
              //       },
              //       activeColor: AppColors.primaryColor,
              //       controlAffinity: ListTileControlAffinity.leading,
              //     );
              //   }).toList(),
              // ),
              // SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "profession".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[7],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[7] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: professionController,
                filled: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "socialMediaOptional".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[8],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[8] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: socialMediaController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/attach.svg'),
                ),
                filled: true,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "interestsAndProjects".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[9],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[9] = value;
                        });
                      })
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: interestsController,
                filled: true,
                maxLines: 5,
                minLines: 3,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _headingText(translatedText: "anythingElseToShare".tr),
                  Spacer(),
                  _subHeadingText(translatedText: "public".tr),
                  SizedBox(width: 4),
                  CustomSwitch(
                      value: isSwitched[10],
                      onChanged: (value) {
                        setState(() {
                          isSwitched[10] = value;
                        });
                      }),
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                controller: anythingElseController,
                filled: true,
                maxLines: 5,
                minLines: 3,
              ),
              SizedBox(height: 24),


              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){},
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFE6ECF3),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Color(0xFFB0C4DB),
                                width: 2)
                        ),
                        child: Center(
                          child: Text("Discard",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryColor,
                              fontSize: 16,
                            ),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Obx(()=> CustomButton(
                        loading: _clientProfileController.isLoading.value,
                        onTap: (){

                          _clientProfileController.updateClientProfile(
                              profileImagePath: _clientProfileController.clientProfileEditImage.value!.path,
                              fullName: nameController.text.trim(),
                              age: ageController.text.trim(),
                              location: locationController.text.trim(),
                              bio: bioController.text.trim(),
                              ethnicity: selectedValue ?? '',
                              gender: selectedGender ?? '',
                              sexualOrientation: selectedSexual ?? '',
                              profession: professionController.text.trim(),
                              socialMedia: socialMediaController.text.trim(),
                              interests: interestsController.text.trim(),
                              anythingElse: anythingElseController.text.trim(),
                              switches: isSwitched);
                        },
                        text: "Save Changes")),
                  )
                ],
              )
            ],
          )),
        ),
    );
  }
}
