import 'package:find_me_a_coach/controllers/clientController/find_coach_controller.dart';
import 'package:find_me_a_coach/controllers/coachController/setup_coach_profile_controller.dart';
import 'package:find_me_a_coach/models/clientModel/category_and_subcategory_model.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/coach_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddCoachPersonalInfoScreen extends StatefulWidget {
  const AddCoachPersonalInfoScreen({super.key});

  @override
  State<AddCoachPersonalInfoScreen> createState() => _AddCoachPersonalInfoScreenState();
}

class _AddCoachPersonalInfoScreenState extends State<AddCoachPersonalInfoScreen> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final locationController = TextEditingController();
  final bioController = TextEditingController();
  final certificationsController = TextEditingController();
  final languageController = TextEditingController();
  final websiteController = TextEditingController();
  final linkedInController = TextEditingController();
  final socialMediaController = TextEditingController();
  final professionController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();
  final priceController = TextEditingController();


final _setupCoachProfileController = Get.put(SetupCoachProfileController());

  final _findCoachController = Get.put(FindCoachController());




  final List<String> selectedCategories = [];

  final List<String> selectedSubcategories = [];


  String selected = "Virtual";

  final Map<String, bool> _checkboxValues = {
    'Neurodiversity Affirming:': false,
    'LGBTQIA+ Affirming:': false,
    'Gender Sensitive:': false,
    'Trauma Sensitive:': false,
    'Faith-Based Approach:': false,
  };

   List<String> dayNames = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday',
  ];
  final Set<int> selectedDayIdx = {};

  List<int> _resolveCategoryIds({
    required List<String> selectedCategoryNames,
    required List<Category> all,
  }) {
    final ids = <int>[];
    for (final c in all) {
      if (selectedCategoryNames.contains(c.name)) ids.add(c.id);
    }
    return ids;
  }

  List<int> _resolveSubcategoryIds({
    required List<String> selectedSubNames,
    required List<Category> all,
  }) {
    final ids = <int>[];
    for (final c in all) {
      for (final s in c.subAreas) {
        if (selectedSubNames.contains(s.name)) ids.add(s.id);
      }
    }
    return ids;
  }


  List<String> _splitToList(String input) => input
      .split(',')
      .map((e) => e.trim())
      .where((e) => e.isNotEmpty)
      .toList();

   List<String> dayShorts = [
    'M', 'T', 'W', 'T', 'F', 'S', 'S',
  ];

  Map<String, List<Map<String, String>>> _buildAvailability(
      Set<int> selectedIdx,
      String fromTime,
      String toTime,
      ) {
    final map = <String, List<Map<String, String>>>{};

    for (final i in selectedIdx) {
      final key = dayNames[i];
      map[key] = [
        {
          'from': fromTime.trim(),
          'to'  : toTime.trim(),
        }
      ];
    }

    return map;
  }



  @override
  void initState() {
    _findCoachController.fetchCategoryAndSubCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx((){
        if(_findCoachController.isCategoryLoading.value){
          return Center(child: CustomPageLoading());
        }
        Map<String, List<String>> categories = {
          for (var cat in _findCoachController.categoryAndSubCategoryList)
            cat.name: cat.subAreas.map((sub) => sub.name).toList()
        };
        return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
            child: SafeArea(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Personal Information",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor,
                            fontSize: 30
                        ),
                      ),
                      SizedBox(height: 8),
                      Text("Provide the necessary information to complete your profile and start accepting clients",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4B5563)
                        ),
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
                                  child:  _setupCoachProfileController.setupCoachProfile.value != null? Image.file(_setupCoachProfileController.setupCoachProfile.value!,
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
                                      _setupCoachProfileController.setupCoachProfileImage(fromCamera: false);
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

                      _headingText(translatedText: "Full Name"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: nameController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/person.svg'),
                        ),
                        hintText: "Enter your full name",
                        filled: true,
                      ),
                      SizedBox(height: 20),

                      _headingText(translatedText: "Age (optional)"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: ageController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/refresh.svg'),
                        ),
                        hintText: "Enter your age",
                        filled: true,
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 20),

                      _headingText(translatedText: "Location"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: locationController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/location.svg'),
                        ),
                        hintText: 'Enter your location',
                      ),

                      SizedBox(height: 20),
                      _headingText(translatedText: "Bio (optional)"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: bioController,
                        hintText: "Enter your bio",
                        minLines: 3,
                        maxLines: 5,
                      ),

                      SizedBox(height: 20),
                      _headingText(translatedText: "Select Coaching Areas"),
                      SizedBox(height: 8),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: categories.keys.map((category) {
                            final isSelected = selectedCategories.contains(category);
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                labelPadding: EdgeInsets.zero,
                                side: BorderSide.none,
                                showCheckmark: false,
                                visualDensity: VisualDensity.compact,
                                selectedColor: Color(0xFF00428A),
                                backgroundColor: Color(0xFFB0C4DB),
                                label: Text(
                                  category,
                                  style: TextStyle(
                                    color: isSelected ? Colors.white : Color(0xFF00428A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                selected: isSelected,
                                onSelected: (selected) {
                                  setState(() {
                                    if (selected) {
                                      selectedCategories.add(category);
                                    } else {
                                      selectedCategories.remove(category);

                                      selectedSubcategories.removeWhere(
                                            (sub) =>categories[category]!.contains(sub),
                                      );
                                    }
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: selectedCategories
                            .expand((category) => categories[category] ?? [])
                            .map((sub) {
                          final isSelected = selectedSubcategories.contains(sub);
                          return ChoiceChip(
                            side: isSelected
                                ? const BorderSide(color: Color(0xFF3368A1), width: 1)
                                : BorderSide.none,
                            showCheckmark: false,
                            label: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (isSelected)
                                  const Icon(
                                    Icons.check,
                                    size: 16,
                                    color: Color(0xFF002F62),
                                  ),
                                Text(
                                  sub,
                                  style: TextStyle(
                                    color: isSelected ? const Color(0xFF002F62) : const Color(0xFF4B5563),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            selected: isSelected,
                            onSelected: (selected) {
                              setState(() {
                                if (selected) {
                                  selectedSubcategories.add(sub);
                                } else {
                                  selectedSubcategories.remove(sub);
                                }
                              });
                            },
                            selectedColor: const Color(0xFFB0C4DB),
                            backgroundColor: const Color(0xFFD1D5DB),
                          );
                        }).toList(),
                      ),


                      SizedBox(height: 20),
                      _headingText(translatedText: "Certifications"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: certificationsController,
                        hintText: "List your relevant certifications here....",
                      ),
                      SizedBox(height: 12,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 180,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Color(0xFFB0C4DB),
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Row(
                            children: [
                              Container(
                                  height: 12,
                                  width: 12,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xFF00428A),width: 1)
                                  ),
                                  child: SvgPicture.asset('assets/icons/add.svg',
                                    color: Color(0xFF00428A),)
                              ),

                              Text("Add Another Certificate",
                                style: TextStyle(
                                    color: Color(0xFF00428A),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500
                                ),)
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 20),
                      _headingText(translatedText: "Language Spoken"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: languageController,
                        hintText: "English",
                      ),

                      SizedBox(height: 20),
                      _headingText(translatedText: "Personal Website or Blog (optional)"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: websiteController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset('assets/icons/attach.svg'),
                        ),
                        hintText: "Add a link to your personal website...",
                      ),

                      SizedBox(height: 20),
                      _headingText(translatedText: "LinkedIn Profile (optional)"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: linkedInController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset('assets/icons/attach.svg'),
                        ),
                        hintText: "Link to your professional LinkedIn profile",
                      ),
                      SizedBox(height: 20),
                      _headingText(translatedText: "Personal Website or Blog (optional)"),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: socialMediaController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset('assets/icons/attach.svg'),
                        ),
                        hintText: "Add a link to your personal website...",
                      ),

                      // Special Considerations
                      SizedBox(height: 20),
                      _headingText(translatedText: 'Special Considerations'),
                      Column(
                        children: _checkboxValues.keys.map((String key) {
                          return CheckboxListTile(
                            title: Text(key.tr, style: AppStyles.h3(color: AppColors.fillTextColor)),
                            value: _checkboxValues[key],
                            onChanged: (bool? value) {
                              setState(() => _checkboxValues[key] = value!);
                            },
                            activeColor: AppColors.primaryColor,
                            controlAffinity: ListTileControlAffinity.leading,
                          );
                        }).toList(),
                      ),

                      SizedBox(height: 20),
                      _headingText(translatedText: 'Session Format Preference'),
                      SizedBox(height: 26),
                      Row(
                        children: [
                          _buildCustomRadio("Virtual", 'assets/icons/computer.svg'),
                          const SizedBox(width: 10),
                          _buildCustomRadio("In-person", 'assets/icons/in_person.svg'),
                        ],
                      ),

                      SizedBox(height: 12,),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Set Your Availability",
                              style: TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(height: 16,),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xFFE6ECF6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Wrap(
                                spacing: 16,
                                children: List.generate(dayNames.length, (index) {
                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (selectedDayIdx.contains(index)) {
                                          selectedDayIdx.remove(index);
                                        } else {
                                          selectedDayIdx.add(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 24,
                                      height: 24,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: selectedDayIdx.contains(index)
                                            ? const Color(0xFFB0C4DB)
                                            : const Color(0xFFDCE8F8),
                                        borderRadius: BorderRadius.circular(4),
                                        border: Border.all(color: const Color(0xFF6B7280)),
                                      ),
                                      child: Text(
                                        dayShorts[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF6B7280),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 8,),

                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text("Time-From",
                                        style: TextStyle(
                                            color: Color(0xFF6B7280),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      SizedBox(height: 7,),
                                      CustomTextField(controller: startController,
                                        hintText: '10:00 AM',
                                        suffixIcon: Icon(Icons.keyboard_arrow_down),)
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12,),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Time-To",
                                        style: TextStyle(
                                            color: Color(0xFF6B7280),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500
                                        ),),
                                      SizedBox(height: 7,),
                                      CustomTextField(controller: endController,
                                        hintText: '10:00 AM',
                                        suffixIcon: Icon(Icons.keyboard_arrow_down),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 108),
                              child: Center(
                                child: CustomButton(onTap: (){},
                                    text: "Add"),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 16,),
                      _headingText(translatedText: 'Price Per Session'),
                      SizedBox(height: 8,),
                      CustomTextField(controller: priceController,
                        hintText: 'Set price',),

                      SizedBox(height: 20),
                      // Obx(
                      //     ()=> CustomButton(
                      //     loading: _findCoachController.isLoading.value,
                      //       onTap: ()async{
                      //
                      //
                      //         final selectedCategoryIds = <int>[];
                      //         final selectedSubcategoryIds = <int>[];
                      //
                      //         for (var cat in _findCoachController.categoryAndSubCategoryList) {
                      //           if (selectedCategories.contains(cat.name)) {
                      //             selectedCategoryIds.add(cat.id);
                      //           }
                      //           for (var sub in cat.subAreas) {
                      //             if (selectedSubcategories.contains(sub.name)) {
                      //               selectedSubcategoryIds.add(sub.id);
                      //             }
                      //           }
                      //         }
                      //
                      //
                      //         final certifications = _splitToList(certificationsController.text);
                      //         final languages = _splitToList(languageController.text);
                      //
                      //
                      //         final availability = _buildAvailability(
                      //           selectedDayIdx,
                      //           startController.text.isEmpty ? '10:00 AM' : startController.text,
                      //           endController.text.isEmpty   ? '06:00 PM' : endController.text,
                      //         );
                      //
                      //
                      //         final neurodiversityAffirming = _checkboxValues['Neurodiversity Affirming:'] ?? false;
                      //         final lgbtqAffirming = _checkboxValues['LGBTQIA+ Affirming:'] ?? false;
                      //         final genderSensitive = _checkboxValues['Gender Sensitive:'] ?? false;
                      //         final traumaSensitive = _checkboxValues['Trauma Sensitive:'] ?? false;
                      //         final faithBased = _checkboxValues['Faith-Based Approach:'] ?? false;
                      //
                      //
                      //         final sessionFormat = selected;
                      //
                      //
                      //         final imagePath = _setupCoachProfileController.setupCoachProfile.value?.path ?? '';
                      //
                      //
                      //         await _setupCoachProfileController.setupCoachProfileData(
                      //           profileImagePath: imagePath,
                      //           fullName: nameController.text.trim(),
                      //           age: ageController.text.trim(),
                      //           location: locationController.text.trim(),
                      //           bio: bioController.text.trim(),
                      //           coachingAreas: selectedCategoryIds,
                      //           subCoachingAreas: selectedSubcategoryIds,
                      //           certifications: certifications,
                      //           languagesSpoken: languages,
                      //           personalWebsite: websiteController.text.trim().isEmpty ? null : websiteController.text.trim(),
                      //           linkedinProfile: linkedInController.text.trim().isEmpty ? null : linkedInController.text.trim(),
                      //           sessionFormat: sessionFormat, // "Virtual" / "In-person"
                      //           availability: availability,
                      //           pricePerSession: priceController.text.trim(),
                      //           neurodiversityAffirming: neurodiversityAffirming,
                      //           genderSensitive: genderSensitive,
                      //           traumaSensitive: traumaSensitive,
                      //           faithBased: faithBased,
                      //         );
                      //
                      //       },
                      //       text: "Save"
                      //   ),
                      // ),

                Obx(() => CustomButton(
                  loading: _findCoachController.isLoading.value,
                  text: "Save",
                  onTap: () async {
                    final selectedCategoryIds = _resolveCategoryIds(
                      selectedCategoryNames: selectedCategories,
                      all: _findCoachController.categoryAndSubCategoryList,
                    );
                    final selectedSubcategoryIds = _resolveSubcategoryIds(
                      selectedSubNames: selectedSubcategories,
                      all: _findCoachController.categoryAndSubCategoryList,
                    );

                    final certifications = _splitToList(certificationsController.text);
                    final languages = _splitToList(languageController.text);

                    final availability = _buildAvailability(
                      selectedDayIdx,
                      startController.text.isEmpty ? '10:00 AM' : startController.text,
                      endController.text.isEmpty ? '06:00 PM' : endController.text,
                    );

                    final neurodiversityAffirming =
                        _checkboxValues['Neurodiversity Affirming:'] ?? false;
                    final genderSensitive =
                        _checkboxValues['Gender Sensitive:'] ?? false;
                    final traumaSensitive =
                        _checkboxValues['Trauma Sensitive:'] ?? false;
                    final faithBased =
                        _checkboxValues['Faith-Based Approach:'] ?? false;

                    final imagePath =
                        _setupCoachProfileController.setupCoachProfile.value?.path ?? '';

                    await _setupCoachProfileController.setupCoachProfileData(
                      profileImagePath: imagePath,
                      fullName: nameController.text.trim(),
                      age: ageController.text.trim(),
                      location: locationController.text.trim(),
                      bio: bioController.text.trim(),
                      coachingAreas: selectedCategoryIds,
                      subCoachingAreas: selectedSubcategoryIds,
                      certifications: certifications,
                      languagesSpoken: languages,
                      personalWebsite: websiteController.text.trim().isEmpty
                          ? null
                          : websiteController.text.trim(),
                      linkedinProfile: linkedInController.text.trim().isEmpty
                          ? null
                          : linkedInController.text.trim(),
                      sessionFormat: selected,
                      availability: availability,
                      pricePerSession: priceController.text.trim(),
                      neurodiversityAffirming: neurodiversityAffirming,
                      genderSensitive: genderSensitive,
                      traumaSensitive: traumaSensitive,
                      faithBased: faithBased,
                    );
                  },
                )),

                SizedBox(height: 40),
                    ])));
        }));
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
      onTap: () => setState(() => selected = value),
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
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
