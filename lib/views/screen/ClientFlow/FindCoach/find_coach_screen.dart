import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class FindCoachScreen extends StatefulWidget {
  const FindCoachScreen({super.key});

  @override
  State<FindCoachScreen> createState() => _FindCoachScreenState();
}

class _FindCoachScreenState extends State<FindCoachScreen> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        backgroundColor: AppColors.textColor,
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 12,
          children: [
            Image.asset('assets/images/app_logo1.png'),
            Spacer(),
            _customContainer(
                onTap: (){
                  Get.to(()=> AiChatScreen());
                },
                image: 'assets/icons/cross.svg'
            ),
            _customContainer(
                onTap: (){
                  Get.to(()=> NotificationScreen());
                },
                image: 'assets/icons/notification.svg'
            ),
            _customContainer(
                onTap: (){},
                image: 'assets/icons/settings.svg'
            ),
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
                    hintText: "Search...",
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset('assets/icons/search.svg'),
                    ),),
                ),
                SizedBox(width: 8,),
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: Color(0xFF3368A1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/filter.svg'),
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:   Row(
              children: [
                Container(
                  width: 106,
                  padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                  height: 34,
                  decoration: BoxDecoration(
                      color: Color(0xFFB0C4DB),
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/drawer.svg'),
                      SizedBox(width: 4,),
                      Text("Categories",
                        style: TextStyle(
                          color: Color(0xFF3368A1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),)

                    ],
                  ),
                ),
                SizedBox(width: 8,),
                _customCategories(
                    text: 'Business & Entrepreneurship'
                ),
                SizedBox(width: 8,),
                _customCategories(text: "Career"),
                SizedBox(width: 8,),
                _customCategories(text: "Family/Parent"),
                SizedBox(width: 8,),
                _customCategories(text: "Financial"),
                SizedBox(width: 8,),
                _customCategories(text: "Health & Wellness"),
                SizedBox(width: 8,),
                _customCategories(text: "Life"),
                SizedBox(width: 8,),
                _customCategories(text: "Life Transitions"),
                SizedBox(width: 8,),
                _customCategories(text: "Neurodiversity"),
                SizedBox(width: 8,),
                _customCategories(text: "Performance"),
                SizedBox(width: 8,),
                _customCategories(text: "Success"),
                SizedBox(width: 8,),
                _customCategories(text: "Sustainability"),
                SizedBox(width: 8,),
                _customCategories(text: "Transformational"),
                SizedBox(width: 8,),
                _customCategories(text: "Youth & Education"),
                SizedBox(width: 8,),
                _customCategories(text: "Youth & Education"),
              ],
            ),
          ),
            SizedBox(height: 16,),

          Expanded(
            child: ListView.separated(
              physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return   Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
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
                                Text("Eleanor Pena",
                                  style: TextStyle(
                                    color: Color(0xFF4B5563),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                Text("Career Coach",
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
                        Text("Helping you find clarity and confidence in your career",
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
                              width: 54,
                              height: 22,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE6ECF3),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Color(0xFF3368A1))
                              ),
                              child: Text("English",
                                style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF00428A)
                                ),
                                textAlign: TextAlign.center,),
                            ),
                            SizedBox(width: 8,),
                            Container(
                              width: 54,
                              height: 22,
                              decoration: BoxDecoration(
                                  color: Color(0xFFE6ECF3),
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(color: Color(0xFF3368A1))
                              ),
                              child: Text("Spanish",
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
                itemCount: 10),
          )

          ],
        ),
      ),
      bottomNavigationBar: ClientBottomMenu(1),
    );
  }

   _customCategories({required String text}) {
    return Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
                height: 34,
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF3368A1)),
                    borderRadius: BorderRadius.circular(4)
                ),
                child: Text(text,
                  style: TextStyle(
                    color: Color(0xFF3368A1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),),
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
                color: Color(0xFF1D4760).withValues(alpha: 0.018),
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
