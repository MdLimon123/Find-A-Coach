import 'package:find_me_a_coach/controllers/clientController/find_coach_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {




  final _findCoachController = Get.put(FindCoachController());


  final List<String> selectedCategories = [];

  final List<String> selectedSubcategories = [];

@override
  void initState() {
    _findCoachController.fetchCategoryAndSubCategory();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'Categories'),
      body: Obx((){
        if(_findCoachController.isCategoryLoading.value){
          return Center(child: CustomPageLoading());
        }
        Map<String, List<String>> categories = {
          for (var cat in _findCoachController.categoryAndSubCategoryList)
            cat.name: cat.subAreas.map((sub) => sub.name).toList()
        };

        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [



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


              Obx(
                  ()=> CustomButton(
                  loading: _findCoachController.isLoading.value,
                    onTap: (){

                  final selectedCategoryIds = <int>[];
                  final selectedSubcategoryIds = <int>[];

                  for (var cat in _findCoachController.categoryAndSubCategoryList) {
                    if (selectedCategories.contains(cat.name)) {
                      selectedCategoryIds.add(cat.id);
                    }
                    for (var sub in cat.subAreas) {
                      if (selectedSubcategories.contains(sub.name)) {
                        selectedSubcategoryIds.add(sub.id);
                      }
                    }
                  }

                  print("Category IDs============>: $selectedCategoryIds");
                  print("Subcategory IDs========>: $selectedSubcategoryIds");

                  _findCoachController.categoryAndSubCategoryFilter(
                      selectedCategories: selectedSubcategoryIds,
                      selectedSubCategories: selectedSubcategoryIds);

                },
                    text: "Apply"),
              )
            ],
          ),
        );
      }),
    );
  }
}
