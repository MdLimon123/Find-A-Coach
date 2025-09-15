import 'package:find_me_a_coach/controllers/clientController/setup_client_profile_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';

import 'package:find_me_a_coach/utils/style.dart'; // Ensure AppStyles.h3 is defined here

import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_switch.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AddPersonalInfo/save_your_goal_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class AddClientPersonalInfoScreen extends StatefulWidget {
  const AddClientPersonalInfoScreen({super.key});

  @override
  State<AddClientPersonalInfoScreen> createState() =>
      _AddClientPersonalInfoScreenState();
}

class _AddClientPersonalInfoScreenState
    extends State<AddClientPersonalInfoScreen> {

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

  final _setupClientProfileController = Get.put(SetupClientProfileController());

  final _formKey = GlobalKey<FormState>();


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
    "heterosexualOrStraight",
    "lesbian",
    "pansexual",
    "queer",
    "preferToSelfDescribeBelow"
  ];

  @override
  void initState() {
    super.initState();
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "shareWhatFeelsRight".tr,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      fontSize: 30),
                ),
                SizedBox(height: 8),
                Text(
                  "completeProfileToFindBestCoachingOptions".tr,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4B5563)),
                ),
                SizedBox(height: 24),
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
                            child:  _setupClientProfileController.clientProfileImage.value != null? Image.file(_setupClientProfileController.clientProfileImage.value!,
                              fit: BoxFit.cover,
                              height: 90,
                              width: 90,): Image.asset('assets/images/user.png'),
                          ),
                        ),
                        Positioned(
                            bottom: 10,
                            right: 5,
                            child: InkWell(
                              onTap: (){
                                _setupClientProfileController.pickClientProfileImage(fromCamera: false);
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
                SizedBox(height: 24),
                _headingText(translatedText: "fullName".tr),
                SizedBox(height: 8),
                CustomTextField(
                  controller: nameController,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/icons/person.svg'),
                  ),
                  hintText: "enterYourFullName".tr,
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
                  hintText: "enterYourAge".tr,
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
                  hintText: "enterYourLocation".tr,
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
                  hintText: "tellUsAboutYourself".tr,
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
                    hintText: "selfDescribeEthnicity".tr,
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
                    hintText: "selfDescribeGender".tr,
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
               // if (selectedSexual == "preferToSelfDescribeBelow".tr)
                  CustomTextField(
                    controller: sexualOrientationSelfDescribeController,
                    hintText: "selfDescribeSexualOrientation".tr,
                    filled: true,
                  ),
                SizedBox(height: 20),
                Row(
                  children: [
                    _headingText(translatedText: "whatsYourNeurotype".tr),
                    Spacer(),
                    _subHeadingText(translatedText: "public".tr),
                    SizedBox(width: 4),
                    CustomSwitch(
                        value: isSwitched[6],
                        onChanged: (value) {
                          setState(() {
                            isSwitched[6] = value;
                          });
                        })
                  ],
                ),
                SizedBox(height: 8),
                Column(
                  children: _checkboxValues.keys.map((String key) {
                    return CheckboxListTile(
                      title: Text(
                        key.tr,
                        style: AppStyles.h3(color: AppColors.fillTextColor), // Ensure AppStyles.h3 is defined
                      ),
                      value: _checkboxValues[key],
                      onChanged: (bool? value) {
                        setState(() {
                          _checkboxValues[key] = value!;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
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
                  hintText: "enterYourProfession".tr,
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
                  hintText: "linkToYourSocialMedia".tr,
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
                  hintText: "tellUsAboutInterestsHobbies".tr,
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
                  hintText: "shareAnyOtherDetails".tr,
                  filled: true,
                  maxLines: 5,
                  minLines: 3,
                ),
                SizedBox(height: 24),
                Obx(
                    ()=> CustomButton(
                    loading: _setupClientProfileController.isLoading.value,
                      onTap: () {
                        if(_formKey.currentState!.validate()){

                          final selectedNeurotypes = _checkboxValues.entries.
                          where((e)=> e.value)
                              .map((e) => e.key).toList();

                          _setupClientProfileController.setupClientProfile(
                              profileImagePath: _setupClientProfileController.clientProfileImage.value!.path,
                              fullName: nameController.text.trim(),
                              age: ageController.text.trim(),
                              location: locationController.text.trim(),
                              bio: bioController.text.trim(),
                              ethnicity: selectedValue ?? '',
                              gender: selectedGender ?? '',
                              sexualOrientation: selectedSexual ?? '',
                              neurotypes: selectedNeurotypes,
                              profession: professionController.text.trim(),
                              socialMedia: socialMediaController.text.trim(),
                              interests: interestsController.text.trim(),
                              anythingElse: anythingElseController.text.trim(),
                              switches: isSwitched);

                        }
                      },
                      text: "completeProfile".tr),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
