import 'package:find_me_a_coach/controllers/language_controller.dart';
import 'package:find_me_a_coach/controllers/localization_controller.dart';
import 'package:find_me_a_coach/models/language_model.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/app_constants.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {

  final _languageController = Get.put(LanguageController());

  final _localizationController = Get.find<LocalizationController>();

  @override
  void initState() {

    final currentLocale = _localizationController.locale;
    final matchedLanguage = AppConstants.languages.firstWhere((language) => language.languageCode == currentLocale.languageCode,
        orElse: () => AppConstants.languages[0]);

    _languageController.selectedLanguage.value = matchedLanguage.languageName.tr;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppbar(title: "Change Language"),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text("Choose a language for the app interface".tr, // Changed
                        style: AppStyles.h4(
                            color: Color(0xFF4B5563),
                            fontWeight: FontWeight.w400
                        ),),
                      SizedBox(height: 24,),
                      Text("selectLanguage".tr,
                        style: AppStyles.h2(
                          color: Color(0xFF4B5563),
                        ),),
                      SizedBox(height: 8,),

                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Dropdown header
                            GestureDetector(
                              onTap: () => _languageController.isExpanded.toggle(),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                                decoration: BoxDecoration(
                                  color: AppColors.textColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: const Color(0xFF8DA9D4)),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _languageController.selectedLanguage.value, // This is already reactive and should update with .tr from initState
                                      style: AppStyles.h3(color: const Color(0xFF4B5563)),
                                    ),
                                    Icon(
                                      _languageController.isExpanded.value
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: const Color(0xFF9CA3AF),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Expanded dropdown content
                            if (_languageController.isExpanded.value) ...[
                              const SizedBox(height: 4),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.textColor,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: const Color(0xFFD1D5DB)),
                                ),
                                child: Column(
                                  children: [
                                    // Search bar
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (val) =>
                                        _languageController.searchQuery.value = val,
                                        decoration: InputDecoration(
                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset('assets/icons/search.svg',
                                              color: Color(0xFF6B7280),),
                                          ),
                                          hintText: "search".tr, // Changed
                                          hintStyle: AppStyles.h3(color: const Color(0xFF9CA3AF)),
                                          filled: true,
                                          fillColor: AppColors.textColor,
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding: const EdgeInsets.symmetric(vertical: 0),
                                        ),
                                      ),
                                    ),
                                    const Divider(height: 1, color: Color(0xFFD1D5DB)),


                                    Obx(() {
                                      return Column(
                                        children: _languageController.filteredLanguages.map((lang) {

                                          bool isSelected = _languageController.selectedLanguage.value == lang.tr;

                                          return GestureDetector(
                                            onTap: () {
                                              _languageController.selectLanguage(lang.tr);
                                              LanguageModel? selectedLangModel = AppConstants.languages.firstWhere(

                                                    (language) => language.languageName == lang,
                                                orElse: () => AppConstants.languages[0],
                                              );
                                              _localizationController.setLanguage(
                                                Locale(selectedLangModel.languageCode, selectedLangModel.countryCode),

                                              );
                                              _languageController.isExpanded.value = false;
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: isSelected
                                                    ? AppColors.primaryColor50 // highlight color
                                                    : Colors.transparent,
                                              ),
                                              child: ListTile(
                                                title: Text(
                                                  lang.tr, // Adjusted if lang is a key
                                                  style: AppStyles.h3(color: const Color(0xFF4B5563)),
                                                ),
                                                trailing: isSelected
                                                    ? Icon(Icons.check_circle, color: AppColors.primaryColor)
                                                    : Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    border:
                                                    Border.all(color: const Color(0xFFD1D5DB), width: 1),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color(0xFF12110D).withValues(alpha: 0.12),
                                                        blurRadius: 20,
                                                        offset: const Offset(0, 4),
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      );
                                    })

                                  ],
                                ),
                              ),
                            ]
                          ],
                        );
                      }),


                    ]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CustomButton(onTap: (){

              },
                  text: 'confirm'.tr),
            )
          ],
        ) );
  }
}
