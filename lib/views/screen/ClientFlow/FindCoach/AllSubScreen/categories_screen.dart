import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Categories'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Horizontal Category Buttons
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

            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
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
              ),
            ),


            CustomButton(onTap: (){},
                text: "Apply")
          ],
        ),
      ),
    );
  }
}
