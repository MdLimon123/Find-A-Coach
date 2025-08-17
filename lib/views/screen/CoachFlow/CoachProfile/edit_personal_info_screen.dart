import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EditPersonalInfoScreen extends StatefulWidget {
  const EditPersonalInfoScreen({super.key});

  @override
  State<EditPersonalInfoScreen> createState() => _EditPersonalInfoScreenState();
}

class _EditPersonalInfoScreenState extends State<EditPersonalInfoScreen> {

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final bioController = TextEditingController();
  final ethnicitySelfDescribeController = TextEditingController();
  final languageController = TextEditingController();
  final sexualOrientationSelfDescribeController = TextEditingController();
  final professionController = TextEditingController();
  final socialMediaController = TextEditingController();
  final interestsController = TextEditingController();
  final anythingElseController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();

  final List<String> categories = [
    'brandingMarketing'.tr,
    'creativeEntrepreneurship'.tr,
    'femaleFounder'.tr,
    'salesClientAcquisition'.tr,
    'smallBusinessesStartups'.tr,
    'sustainableBusiness'.tr,
    'careerDevelopment'.tr,
    'careerDiscovery'.tr,
    'careerTransitions'.tr,
    'executiveLeadership'.tr,
    'jobSearch'.tr,
    'interviews'.tr,
    'mentorship'.tr,
    'networking'.tr,
    'resumeDevelopment'.tr,
    'salaryNegotiation'.tr,
    'successionPlanning'.tr,
    'teamOrientedCoaching'.tr,
    'workLifeBalance'.tr,
    'adolescentsTeens'.tr,
    'adoption'.tr,
    'becomingAParent'.tr,
    'coParentingBlendedFamilies'.tr,
    'coRegulation'.tr,
    'childrenLeavingHome'.tr,
    'earlyChildhood'.tr,
    'homeschooling'.tr,
    'neurodivergentFamilies'.tr,
    'parentingNeurodivergentChildren'.tr,
    'parentAdvocacy'.tr,
    'positiveParenting'.tr,
    'specialNeeds'.tr,
    'ttcInfertilityMiscarriage'.tr,
    'debtFree'.tr,
    'financialFreedom'.tr,
    'financialPlanning'.tr,
    'moneyMindset'.tr
  ];

  List<String> selectedCategories = [];
  String? selectedValue;
  String selected = "Virtual";

  final Map<String, bool> _checkboxValues = {
    'neurodiversityAffirming'.tr: false,
    'lgbtqiaAffirming'.tr: false,
    'genderSensitive'.tr: false,
    'traumaSensitive'.tr: false,
    'faithBasedApproach'.tr: false,
  };

  List<String> dayShorts = [
    'M'.tr,
    'T'.tr,
    'W'.tr,
    'T'.tr,
    'F'.tr,
    'S'.tr,
    'S'.tr,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "editProfile".tr),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // User Image Stack
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 144,
                      width: 144,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFFFFF),
                        border: Border.all(color: Color(0xFF8DA9D4)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/user.png')),
                      ),
                    ),
                    Positioned(
                        bottom: 10,
                        right: 5,
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
                        ))
                  ],
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

              _headingText(translatedText: "ageOptional".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: ageController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/refresh.svg'),
                ),
                hintText: "enterYourAge".tr,
                filled: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              _headingText(translatedText: "location".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: locationController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/location.svg'),
                ),
                hintText: 'enterYourLocation'.tr,
              ),
              SizedBox(height: 20),

              _headingText(translatedText: "bioOptional".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: bioController,
                hintText: "tellUsAboutYourself".tr,
                minLines: 3,
                maxLines: 5,
              ),
              SizedBox(height: 20),

              _headingText(translatedText: 'selectCoachingAreas'.tr),
              SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: categories.map((category) {
                  return ChoiceChip(
                    selectedColor: Color(0xFFB0C4DB),
                    backgroundColor: Color(0xFFFFFFFF),
                    label: Text(category,
                      style: TextStyle(
                        color: selectedCategories.contains(category) ? Color(0xFF00428A) : Color(0xFF4B5563),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    selected: selectedCategories.contains(category),
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedCategories.add(category);
                        } else {
                          selectedCategories.remove(category);
                        }
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 20),
              _headingText(translatedText: "certifications".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: ethnicitySelfDescribeController,
                hintText: 'listYourCertifications'.tr,
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 26,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  margin: EdgeInsets.only(bottom: 6, right: 6),
                  width: 177,
                  decoration: BoxDecoration(
                      color: Color(0xFFB0C4DB),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFF00428A))
                          ),
                          child: Center(child: Icon(Icons.add,color: AppColors.primaryColor,
                            size: 14,)),
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text("addAnotherCertificate".tr,
                        style: TextStyle(
                          color: Color(0xFF00428A),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),)

                    ],
                  ),
                ),
              ),

              SizedBox(height: 20),
              _headingText(translatedText: "languageSpoken".tr),
              SizedBox(height: 8),
              CustomTextField(controller: languageController,
                hintText: 'enterLanguage'.tr,
                suffixIcon: Icon(Icons.keyboard_arrow_down,
                  color: Color(0xFF4B5563),),),

              SizedBox(height: 20),
              _headingText(translatedText: 'personalWebsiteOptional'.tr),
              SizedBox(height: 8),
              CustomTextField(controller: socialMediaController,
                hintText: 'enterWebsite'.tr,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/attach.svg'),
                ),),

              SizedBox(height: 20),
              _headingText(translatedText: 'linkedinProfileOptional'.tr),
              SizedBox(height: 8),
              CustomTextField(controller: socialMediaController,
                hintText: 'linkLinkedIn'.tr,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/attach.svg'),
                ),),

              SizedBox(height: 20),
              _headingText(translatedText: 'specialConsiderations'.tr),
              Column(
                children: _checkboxValues.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key.tr,
                      style: AppStyles.h3(color: AppColors.fillTextColor),
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
              _headingText(translatedText: 'sessionFormatPreference'.tr),
              SizedBox(height: 26),
              Row(
                children: [
                  _buildCustomRadio("virtual".tr, 'assets/icons/computer.svg'),
                  const SizedBox(width: 10),
                  _buildCustomRadio("inPerson".tr, 'assets/icons/in_person.svg'),
                ],
              ),

              SizedBox(height: 16),
              _headingText(translatedText: "setAvailability".tr),
              // Add rest of availability, pricing, and Save Changes button similarly with .tr
              // ...
              CustomButton(onTap: (){}, text: "saveChanges".tr),
            ],
          ),
        ),
      ),
    );
  }

  _headingText({required String translatedText}) {
    return Text(
      translatedText,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: AppColors.bigTextColor,
        fontSize: 16,
      ),
    );
  }

  _buildCustomRadio(String value, String image) {
    final bool isSelected = selected == value;

    return InkWell(
      onTap: () {
        setState(() {
          selected = value;
        });
      },
      child: Row(
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2,
              ),
            ),
            child: Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: isSelected ? 10 : 0,
                height: isSelected ? 10 : 0,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 44,
            width: 124,
            padding: EdgeInsets.symmetric(horizontal: 2),
            decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(8)
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SvgPicture.asset(image),
                ),
                Text(value,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
