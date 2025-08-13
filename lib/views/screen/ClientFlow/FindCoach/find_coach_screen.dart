import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/FindCoach/AllSubScreen/categories_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/FindCoach/AllSubScreen/category_filter_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Import GetX


class FindCoachScreen extends StatefulWidget {
  const FindCoachScreen({super.key});

  @override
  State<FindCoachScreen> createState() => _FindCoachScreenState();
}

class _FindCoachScreenState extends State<FindCoachScreen> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.textColor,
          automaticallyImplyLeading: false,
          title: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/app_logo1.png'),

              Row(
                children: [
                  _customContainer(
                      onTap: (){
                        Get.to(()=> AiChatScreen());
                      },
                      image: 'assets/icons/cross.svg' // Assuming this is a placeholder, cross usually means close/cancel
                    // For AI Chat, maybe a chat bubble icon?
                  ),
                  SizedBox(width: 8), // Spacing between icons
                  _customContainer(
                      onTap: (){
                        Get.to(()=> NotificationScreen());
                      },
                      image: 'assets/icons/notification.svg'
                  ),
                  SizedBox(width: 8), // Spacing between icons
                  _customContainer(
                      onTap: (){
                        // TODO: Navigate to Settings Screen
                      },
                      image: 'assets/icons/settings.svg'
                  ),
                ],
              )
            ],
          )
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomTextField(controller: searchController,
                    hintText: "findCoachScreen.searchHint".tr, // Changed
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),),
                ),
                SizedBox(width: 8,),
                InkWell(
                  onTap: (){
                    Get.to(()=> CategoryFilterScreen());
                  },
                  child: Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFF3368A1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: SvgPicture.asset('assets/icons/filter.svg'),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: (){
                      Get.to(()=> CategoriesScreen());
                    },
                    child: Container(
                      width: 106,
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                      height: 34,
                      decoration: BoxDecoration(
                          color: Color(0xFFB0C4DB),
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min, // To fit content
                        children: [
                          SvgPicture.asset('assets/icons/drawer.svg'),
                          SizedBox(width: 4,),
                          Text("findCoachScreen.categoriesLabel".tr, // Changed
                            style: TextStyle(
                              color: Color(0xFF3368A1),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            overflow: TextOverflow.ellipsis, // Prevent overflow
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8,),
                  _customCategories(textKey: 'findCoachScreen.categoryBusinessEntrepreneurship'), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryCareer"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryFamilyParent"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryFinancial"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryHealthWellness"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryLife"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryLifeTransitions"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryNeurodiversity"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryPerformance"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categorySuccess"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categorySustainability"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryTransformational"), // Changed
                  SizedBox(width: 8,),
                  _customCategories(textKey: "findCoachScreen.categoryYouthEducation"), // Changed
                  // SizedBox(width: 8,), // Duplicate key if text is the same
                  // _customCategories(textKey: "findCoachScreen.categoryYouthEducation"),
                ],
              ),
            ),
            SizedBox(height: 16,),

            Expanded(
              child: ListView.separated(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    // Assuming this is placeholder data. If dynamic, this localization approach is incorrect here.
                    return   Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: AppColors.textColor, // This might be too light if textColor is whiteish
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                                        fit: BoxFit.cover)
                                ),
                              ),
                              SizedBox(width: 12,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("findCoachScreen.coachList.exampleName".tr, // Changed
                                    style: TextStyle(
                                      color: Color(0xFF4B5563),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  Text("findCoachScreen.coachList.exampleTitle".tr, // Changed
                                    style: TextStyle(
                                      color: Color(0xFF6B7280),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),)
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text("findCoachScreen.coachList.exampleBio".tr, // Changed
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),),
                          SizedBox(height: 8,),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/global.svg'),
                              SizedBox(width: 8,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3), // Added padding
                                // width: 54, // Width should be dynamic based on text
                                height: 22,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6ECF3),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Color(0xFF3368A1))
                                ),
                                child: Text("findCoachScreen.coachList.languageEnglish".tr, // Changed
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF00428A)
                                  ),
                                  textAlign: TextAlign.center,),
                              ),
                              SizedBox(width: 8,),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3), // Added padding
                                // width: 54, // Width should be dynamic based on text
                                height: 22,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6ECF3),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Color(0xFF3368A1))
                                ),
                                child: Text("findCoachScreen.coachList.languageSpanish".tr, // Changed
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF00428A)
                                  ),
                                  textAlign: TextAlign.center,),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (_, index)=> SizedBox(height: 16,),
                  itemCount: 10 // This suggests the above is placeholder data
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ClientBottomMenu(1), // Ensure ClientBottomMenu is also localized if it contains text
    );
  }

  _customCategories({required String textKey}) { // Changed parameter name
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      height: 34,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3368A1)),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Text(textKey.tr, // Changed to use .tr
        style: TextStyle(
          color: Color(0xFF3368A1),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis, // Prevent overflow for long category names
      ),
    );
  }

  _customContainer({required String image, required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF5480B1), width: 0.8),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1D4760).withOpacity(0.018), // Corrected withOpacity
                blurRadius: 2.2,
                offset: Offset(0, 3),
              ),
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
