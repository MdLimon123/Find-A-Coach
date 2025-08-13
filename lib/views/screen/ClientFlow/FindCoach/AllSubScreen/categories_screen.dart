import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Categories'),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: categories.map((category) {
            return ChoiceChip(
              selectedColor: Color(0xFF00428A),
              backgroundColor: Color(0xFFB0C4DB),
              label: Text(category,
              style: TextStyle(
                color: selectedCategories.contains(category) ? Colors.white : Color(0xFF00428A),
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
      ),
    );
  }
}
