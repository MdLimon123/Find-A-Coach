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




  final Map<String, List<String>> categories = {
    "Business & Entrepreneurship Coaching": [
      "Branding & Marketing Strategy",
      "Creative Entrepreneurship",
      "Female Founder",
      "Sales & Client Acquisition",
      "Small Businesses & Start-Ups",
      "Sustainable Business",
    ],
    "Career Coaching": [
      "Career Development",
      "Career Discovery",
      "Career Transitions",
      "Executive Leadership",
      "Job Search",
      "Interviews",
      "Mentorship",
      "Networking",
      "Resume Development",
      "Salary Negotiation",
      "Succession Planning",
      "Team-Oriented Coaching",
      "Work-Life Balance",
    ],
    "Family/Parent Coaching": [
      "Adolescents/Teens",
      "Adoption",
      "Becoming a Parent",
      "Co-Parenting & Blended Families",
      "Co-Regulation",
      "Children Leaving Home/Empty Nest",
      "Early Childhood",
      "Homeschooling",
      "Neurodivergent Families",
      "Parenting Neurodivergent Children",
      "Parent Advocacy",
      "Positive Parenting",
      "Special Needs",
      "TTC/Infertility/Miscarriage",
    ],
    "Financial Coaching": [
      "Debt-Free",
      "Financial Freedom",
      "Financial Planning",
      "Money Mindset",
      "Retirement Planning",
      "Wealth Coaching",
    ],
    "Health & Wellness Coaching": [
      "Addiction Recovery",
      "Anxiety Management",
      "Breathing",
      "Burnout Prevention & Recovery",
      "Emotional Eating",
      "Emotional Intelligence",
      "Emotional Regulation",
      "Emotional Wellbeing",
      "Female Hormonal Health",
      "Female Reproductive Health",
      "Fitness",
      "Gut-Brain Connection",
      "Gut Health",
      "Happiness Coaching",
      "Health Coaching",
      "Health Coaching for Seniors",
      "Meditation",
      "Menopause",
      "Men's Health",
      "Mental Health Coaching",
      "Mindfulness",
      "Nervous System Regulation",
      "Nutrition/Diet",
      "Nutrition for Children",
      "Nutrition for Menopause",
      "Personal Resilience",
      "Polyvagal Theory",
      "Sleep Health",
      "Somatic/Body-based Coaching",
      "Stress Management",
      "Weight Loss/Weight Management",
      "Women's Health",
    ],
    "Life Coaching": [
      "Confidence & Self-Esteem",
      "Creativity",
      "Empowerment",
      "Intuition",
      "LGBTQIA+ Life Coaching",
      "Life Purpose",
      "Life Skills",
      "Marriage/Relationships/Intimacy",
      "Mindset",
      "Neurodivergent Life Coaching",
      "Personal Development",
      "Productivity & Time Management",
      "Social Coaching",
      "Spiritual Life Coaching",
    ],
    "Life Transitions Coaching": [
      "Death of a Loved One",
      "Divorce/Break-Up",
      "Identity Shifts",
      "Job Loss/Change",
      "Life-Changing Accident/Illness/Injury",
      "Major Life Event",
      "Marriage/Partnership",
      "Moving/Relocation",
      "Retirement",
      "Returning to Work",
    ],
    "Neurodiversity": [
      "ADD",
      "ADHD",
      "AuDHD",
      "Autism",
      "Dyscalculia",
      "Dysgraphia",
      "Dyslexia",
      "Dyspraxia - Developmental Coordination Disorder (DCD)",
      "Highly Sensitive Person (HSP)",
      "Hyperlexia",
      "Learning Disorder",
      "Obsessive-Compulsive Disorder (OCD)",
      "Sensory Processing Disorder (SPD)",
      "Synesthesia",
      "Tourette’s Syndrome",
      "Communication Skills",
      "Emotional Regulation",
      "Executive Function",
      "Identity Exploration & Self-Acceptance",
      "Life Skills for Neurodivergent Adults",
      "Life Skills for Neurodivergent Teens",
      "Life Transitions for Neurodivergent Adults",
      "Neurodivergent Families",
      "Neurodivergent Life Coaching",
      "Neurodivergent Student Coaching",
      "Parenting Neurodivergent Children",
      "Parent Advocacy for Neurodivergent Children",
      "Productivity & Time Management",
      "Self Advocacy",
      "Social Skills",
      "Transition to Adulthood for Neurodivergent Teens",
    ],
    "Performance Coaching": [],
    "Success Coaching": [],
    "Sustainability Coaching": [
      "Biodiversity Awareness",
      "Community Resilience",
      "Eco-Coaching",
      "Eco-Conscious Living",
      "Family/Household Resilience",
      "Outdoors/Nature-based Coaching",
      "Regenerative Leadership",
      "Sustainable Business",
    ],
    "Transformational Coaching": [],
    "Youth & Education Coaching": [
      "Academic & Study",
      "Parent Advocacy",
      "Teen Life Skills",
      "Transition to Adulthood",
    ],
  };


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
                              // Remove subcategories of this category when deselected
                              selectedSubcategories.removeWhere(
                                    (sub) => categories[category]!.contains(sub),
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
                  width: 177,
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
                controller: certificationsController,
                hintText: "English",
              ),

              SizedBox(height: 20),
              _headingText(translatedText: "Personal Website or Blog (optional)"),
              SizedBox(height: 8),
              CustomTextField(
                controller: certificationsController,
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
                controller: certificationsController,
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
                controller: certificationsController,
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
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6ECF6),
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
                                    color:  const Color(0xFFDCE8F8),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Color(0xFF6B7280))
                                  ),
                                  child: Text(
                                    dayShorts[index],
                                    style: TextStyle(
                                      fontSize: 16,
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
                              CustomTextField(controller: startController,
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
              CustomTextField(controller: startController,
                hintText: 'Set price',),

              SizedBox(height: 20),
              CustomButton(
                  onTap: (){},
                  text: "Save"
              ),
              SizedBox(height: 40),
        ]))));
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
