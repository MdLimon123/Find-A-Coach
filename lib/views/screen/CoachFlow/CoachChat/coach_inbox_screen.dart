import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachChat/coach_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachSetting/coach_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../ClientFlow/Notification/notification_screen.dart';
import '../../ClientFlow/Settings/settings_screen.dart';

class CoachInboxScreen extends StatefulWidget {
  const CoachInboxScreen({super.key});

  @override
  State<CoachInboxScreen> createState() => _CoachInboxScreenState();
}

class _CoachInboxScreenState extends State<CoachInboxScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.textColor,
          automaticallyImplyLeading: false,
          title: Row(
            spacing: 12,
            children: [
              Image.asset('assets/images/app_logo1.png'),
              Spacer(),
              _customContainer(
                  onTap: (){
                    Get.to(()=> CoachAiChatScreen());
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
                  onTap: (){
                    Get.to(()=> CoachSettingsScreen());
                  },
                  image: 'assets/icons/settings.svg'
              ),
            ],
          )
      ),
      body: ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          itemBuilder: (context, index){
            return InkWell(
              onTap: (){
                Get.to(()=> CoachChatScreen());
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                                  fit: BoxFit.cover)
                          ),

                        ),
                        SizedBox(width: 10,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text("Savannah Nguyen",
                                  style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                SizedBox(width: 40,),
                                Text(' 08:09 PM',
                                  style: TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),)
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                Text("Sequi quae aliquid numquam...",
                                  style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),),
                                SizedBox(width: 30,),
                                Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle
                                  ),
                                  child: Text("2",
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (__,___)=> SizedBox(height: 8,),
          itemCount: 10),

      bottomNavigationBar: CoachBottomMenu(3),
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
