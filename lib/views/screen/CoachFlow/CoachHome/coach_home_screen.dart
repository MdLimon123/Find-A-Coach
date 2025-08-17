import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/settings_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoachHomeScreen extends StatefulWidget {
  const CoachHomeScreen({super.key});

  @override
  State<CoachHomeScreen> createState() => _CoachHomeScreenState();
}

class _CoachHomeScreenState extends State<CoachHomeScreen> {
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
                    Get.to(()=> SettingsScreen());
                  },
                  image: 'assets/icons/settings.svg'
              ),
            ],
          )
      ),
      bottomNavigationBar: CoachBottomMenu(0),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("#Upcoming session",
                  style: TextStyle(
                    color: Color(0xFFB0C4DB),
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 8,),
                  Row (
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                          fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text("Dianne Russell",
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF002F62),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Date
                        Row(
                          children: const [
                            Icon(Icons.calendar_today, color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "Monday, June 15",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SizedBox(
                            height: 24, //
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),


                        // Time
                        Row(
                          children: const [
                            Icon(Icons.access_time, color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "10:00 AM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Device Icon
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Icon(Icons.computer, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 24,),
            Text("Requested Sessions",
              style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),),
            SizedBox(height: 12,),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index){
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: AppColors.textColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Column(
                        children: [
                          Row (
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                                        fit: BoxFit.cover)
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text("Leslie Alexander",
                                style: TextStyle(
                                    color: Color(0xFF1F2937),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500
                                ),)
                            ],
                          ),
                          SizedBox(height: 16,),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child:  Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // Date
                                Row(
                                  children: const [
                                    Icon(Icons.calendar_today, color: Color(0xFF00428A), size: 18),
                                    SizedBox(width: 6),
                                    Text(
                                      "Monday, June 15",
                                      style: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),

                                // Divider
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 6),
                                  child: SizedBox(
                                    height: 24, //
                                    child: VerticalDivider(
                                      color: Color(0xFF4B5563),
                                      thickness: 1,
                                      width: 1,
                                    ),
                                  ),
                                ),


                                // Time
                                Row(
                                  children: const [
                                    Icon(Icons.access_time,color: Color(0xFF4B5563), size: 18),
                                    SizedBox(width: 6),
                                    Text(
                                      "10:00 AM",
                                      style: TextStyle(
                                        color: Color(0xFF4B5563),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),

                                // Device Icon
                                 Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Container(
                                    height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF002F62),
                                        shape: BoxShape.circle
                                      ),
                                      child: Icon(Icons.computer, color: Colors.white, size: 18)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16,),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 44,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE6ECF3),
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Color(0xFFE6E7EA),width: 1),
                                  ),
                                  child: Center(
                                    child: Text("Decline",
                                    style: TextStyle(
                                      color: Color(0xFF031330),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),
                              Expanded(
                                child: CustomButton(onTap: (){},
                                    text: 'Accept'),
                              )
                            ],
                          )
                        ],
                      )
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: 12),
                  itemCount: 5),
            )

          ],
        ),
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
