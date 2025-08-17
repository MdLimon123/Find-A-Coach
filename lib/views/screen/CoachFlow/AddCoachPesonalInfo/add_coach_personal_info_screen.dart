import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
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

  final List<String> categories = [
    'Branding & Marketing Strategy', 'Creative Entrepreneurship', 'Female Founder',
    'Sales & Client Acquisition', 'Small Businesses & Start-Ups', 'Sustainable Business',
    'Career Development', 'Career Discovery', 'Career Transitions', 'Executive Leadership',
    'Job Search', 'Interviews', 'Mentorship', 'Networking', 'Resume Development',
    'Salary Negotiation', 'Succession Planning', 'Team-Oriented Coaching',
    'Work-Life Balance', 'Adolescents/Teens', 'Adoption', 'Becoming a Parent',
    'Co-Parenting & Blended Families', 'Co-Regulation', 'Children Leaving Home/Empty Nest',
    'Early Childhood', 'Homeschooling', 'Neurodivergent Families',
    'Parenting Neurodivergent Children', 'Parent Advocacy', 'Positive Parenting',
    'Special Needs', 'TTC/Infertility/Miscarriage', 'Debt-Free', 'Financial Freedom',
    'Financial Planning', 'Money Mindset'
  ];

  List<String> selectedCategories = [];
  String selected = "Virtual";

  final Map<String, bool> _checkboxValues = {
    'Neurodiversity Affirming:': false,
    'LGBTQIA+ Affirming:': false,
    'Gender Sensitive:': false,
    'Trauma Sensitive:': false,
    'Faith-Based Approach:': false,
  };

  final List<String> dayShorts = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("personalInfo.title".tr,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 30
                ),
              ),
              SizedBox(height: 8),
              Text("personalInfo.subtitle".tr,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5563)
                ),
              ),
              SizedBox(height: 24),

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
                            image: AssetImage('assets/images/user.png')
                        ),
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
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 24),

              _headingText(translatedText: "personalInfo.fullName".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: nameController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/person.svg'),
                ),
                hintText: "personalInfo.enterFullName".tr,
                filled: true,
              ),
              SizedBox(height: 20),

              _headingText(translatedText: "personalInfo.age".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: ageController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/refresh.svg'),
                ),
                hintText: "personalInfo.enterAge".tr,
                filled: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),

              _headingText(translatedText: "personalInfo.location".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: locationController,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/location.svg'),
                ),
                hintText: 'personalInfo.enterLocation'.tr,
              ),

              SizedBox(height: 20),
              _headingText(translatedText: "personalInfo.bio".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: bioController,
                hintText: "personalInfo.bioHint".tr,
                minLines: 3,
                maxLines: 5,
              ),

              SizedBox(height: 20),
              _headingText(translatedText: "personalInfo.coachingAreas".tr),
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
                        if (selected) selectedCategories.add(category);
                        else selectedCategories.remove(category);
                      });
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 20),
              _headingText(translatedText: "personalInfo.certifications".tr),
              SizedBox(height: 8),
              CustomTextField(
                controller: certificationsController,
                hintText: "personalInfo.certificationsHint".tr,
              ),

              // Special Considerations
              SizedBox(height: 20),
              _headingText(translatedText: 'personalInfo.specialConsiderations'.tr),
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
              _headingText(translatedText: 'personalInfo.sessionFormat'.tr),
              SizedBox(height: 26),
              Row(
                children: [
                  _buildCustomRadio("Virtual", 'assets/icons/computer.svg'),
                  const SizedBox(width: 10),
                  _buildCustomRadio("In-person", 'assets/icons/in_person.svg'),
                ],
              ),

              SizedBox(height: 20),
              CustomButton(
                  onTap: (){},
                  text: "personalInfo.saveButton".tr
              ),
              SizedBox(height: 40),
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
