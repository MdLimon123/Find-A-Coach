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
  final ethnicitySelfDescribeController = TextEditingController();
  final languageController = TextEditingController();
  final sexualOrientationSelfDescribeController = TextEditingController();
  final professionController = TextEditingController();
  final socialMediaController = TextEditingController();
  final interestsController = TextEditingController();
  final anythingElseController = TextEditingController();
  final startController = TextEditingController();
  final endController = TextEditingController();

  // List of available categories
  final List<String> categories = [
    'Branding & Marketing Strategy',
    'Creative Entrepreneurship',
    'Female Founder',
    'Sales & Client Acquisition',
    'Small Businesses & Start-Ups',
    'Sustainable Business',
    'Career Development',
    'Career Discovery',
    'Career Transitions',
    'Executive Leadership',
    'Job Search',
    'Interviews',
    'Mentorship',
    'Networking',
    'Resume Development',
    'Salary Negotiation',
    'Succession Planning',
    'Team-Oriented Coaching',
    'Work-Life Balance',
    'Adolescents/Teens',
    'Adoption',
    'Becoming a Parent',
    'Co-Parenting & Blended Families',
    'Co-Regulation',
    'Children Leaving Home/Empty Nest',
    'Early Childhood',
    'Homeschooling',
    'Neurodivergent Families',
    'Parenting Neurodivergent Children',
    'Parent Advocacy',
    'Positive Parenting',
    'Special Needs',
    'TTC/Infertility/Miscarriage',
    'Debt-Free',
    'Financial Freedom',
    'Financial Planning',
    'Money Mindset'
  ];

  // List to keep track of selected categories
  List<String> selectedCategories = [];
  String? selectedValue;
  String selected = "Virtual";

  Map<String, bool> _checkboxValues = {
    'Neurodiversity Affirming:': false,
    'LGBTQIA+ Affirming:': false,
    'Gender Sensitive:': false,
    'Trauma Sensitive:': false,
    'Faith-Based Approach:': false,

  };

  List<String> dayShorts = [
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
    'S',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 24),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(
                "Personal Information",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                    fontSize: 30),
              ),
              SizedBox(height: 8),
              Text(
                "Provide the necessary information to complete your profile and start accepting clients",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5563)),
              ),
              SizedBox(height: 24),
              Center( // User Image Stack - No text to translate here
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
                controller: nameController, // TODO: Use a separate TextEditingController here
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/person.svg'),
                ),
                hintText: "enterYourFullName".tr,
                filled: true,
              ),
              SizedBox(height: 20),

                  _headingText(translatedText: "Age (Optional)"),

              SizedBox(height: 8),
              CustomTextField(
                controller: ageController, // TODO: Use a separate TextEditingController here
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/refresh.svg'), // Consider different icon
                ),
                hintText: "enterYourAge".tr,
                filled: true,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              _headingText(translatedText: "Location"),
              SizedBox(height: 8,),
              CustomTextField(controller: locationController,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/location.svg'),
              ),
              hintText: 'Enter your location',),
              SizedBox(height: 20,),
              _headingText(translatedText: "Bio (optional)"),
              SizedBox(height: 8,),
              CustomTextField(
                controller: bioController, // TODO: Use a separate TextEditingController here
                hintText: "tellUsAboutYourself".tr,
                minLines: 3,
                maxLines: 5,
              ),
              SizedBox(height: 20,),
              _headingText(translatedText: 'Select Coaching Areas'),
              SizedBox(height: 8,),
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
                      ),),
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
              SizedBox(height: 20,),
              _headingText(translatedText: "Certifications"),
              SizedBox(height: 8,),
              CustomTextField(controller: ethnicitySelfDescribeController,
              hintText: 'List your relevant certifications here....',),
              SizedBox(height: 20,),
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
                          child:  Center(child: Icon(Icons.add,color: AppColors.primaryColor,
                          size: 14,)),
                        ),
                      ),
                      SizedBox(width: 4,),
                      Text("Add Another Certificate",
                      style: TextStyle(
                        color: Color(0xFF00428A),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),)
                      
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              _headingText(translatedText: "Language Spoken"),
              SizedBox(height: 8,),
              CustomTextField(controller: languageController,
              hintText: 'Enter your language here....',
              suffixIcon: Icon(Icons.keyboard_arrow_down,
              color: Color(0xFF4B5563),),),
              SizedBox(height: 20,),
              _headingText(translatedText: 'Personal Website or Blog (optional)'),
              SizedBox(height: 8,),
              CustomTextField(controller: socialMediaController,
              hintText: 'Enter your website or blog here....',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/attach.svg'),
              ),),
              SizedBox(height: 20,),
              _headingText(translatedText: 'LinkedIn Profile (optional)'),
              SizedBox(height: 8,),
              CustomTextField(controller: socialMediaController,
                hintText: 'Link to your professional LinkedIn profile',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/attach.svg'),
                ),),
              SizedBox(height: 20,),
              _headingText(translatedText: 'Personal Website or Blog (optional)'),
              SizedBox(height: 8,),
              CustomTextField(controller: socialMediaController,
                hintText: 'Add a link to your personal website...',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset('assets/icons/attach.svg'),
                ),),
              SizedBox(height: 20,),
              _headingText(translatedText: 'Special Considerations'),
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
              SizedBox(height: 20,),
              _headingText(translatedText: 'Session Format Preference'),
              SizedBox(height: 26,),

              Row(
                children: [
                  _buildCustomRadio("Virtual",
                  'assets/icons/computer.svg'),
                  const SizedBox(width: 10),
                  _buildCustomRadio("In-person",
                  'assets/icons/in_person.svg'),
                ],
              ),
              SizedBox(height: 16,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headingText(translatedText: "Set Your Availability"),
                    SizedBox(height: 16,),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF5FD),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Wrap(
                            spacing: 16,
                            children: List.generate(dayShorts.length, (index) {
                              return GestureDetector(
                                onTap: (){},
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: const Color(0xFF3368A1)
                                    ),
                                  ),
                                  child: Text(
                                    dayShorts[index],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
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
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF6B7280),
                              ),),
                              SizedBox(height: 4,),
                              CustomTextField(controller: startController,
                              hintText: '10:00 AM',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SvgPicture.asset('assets/icons/key.svg'),
                              ),)
                          
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Time-From",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF6B7280),
                                ),),
                              SizedBox(height: 4,),
                              CustomTextField(controller: startController,
                                hintText: '10:00 AM',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: SvgPicture.asset('assets/icons/key.svg'),
                                ),)
                          
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 16,),
                    Center(
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color:Color(0xFF3368A1),
                          borderRadius: BorderRadius.circular(12)
                        ),
                        child: Center(
                          child: Text('Add',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textColor
                          ),),
                        ),
                      ),
                    )

                  ],
                ),
              ),
              SizedBox(height: 20,),
              _headingText(translatedText: 'Price Per Session'),
              SizedBox(height: 8,),
              CustomTextField(controller: professionController,
              hintText: 'Set price',),
              SizedBox(height: 24,),
              CustomButton(onTap: (){},
                  text: "Save")


            ],
          ),
        )
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
   _buildCustomRadio(String value,  String image) {
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
