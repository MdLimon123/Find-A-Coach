import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/AllTabsScreen/booking_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart'; // Import GetX

class UpcomingScreen extends StatefulWidget {
  const UpcomingScreen({super.key});

  @override
  State<UpcomingScreen> createState() => _UpcomingScreenState();
}

class _UpcomingScreenState extends State<UpcomingScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index){
          return InkWell(
            onTap: (){
              Get.to(()=> BookingDetailsScreen());
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.textColor, // Check contrast: if textColor is light, this background is light.
                  borderRadius: BorderRadius.circular(12)
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
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                                fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 4,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "upcomingScreen.coachNameExample".tr, // Changed
                            style: TextStyle(
                                color: Color(0xFF1F2937),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),),
                          SizedBox(height: 4,),
                          Text(
                            "upcomingScreen.coachTitleExample".tr, // Changed
                            style: TextStyle(
                                color: AppColors.bigTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6ECF3), // light background
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        // Calendar + Date
                        Row(
                          children: [
                            SvgPicture.asset('assets/icons/calender.svg'),
                            SizedBox(width: 6),
                            Text(
                              "upcomingScreen.today".tr, // Changed
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(width: 30,),
                        // Divider
                        Container(
                          width: 1,
                          height: 20,
                          color: Color(0xFF4B5563),
                        ),
                        SizedBox(width: 30,),
                        // Clock + Time
                        Row(
                          children: [
                            Icon(Icons.access_time, size: 16, color: AppColors.primaryColor),
                            SizedBox(width: 6),
                            Text(
                              "upcomingScreen.now".tr, // Changed
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4B5563),
                              ),
                            ),
                          ],
                        ),

                        Spacer(),

                        // People icon button
                        Container(
                          height: 28,
                          width: 28,
                          decoration: BoxDecoration(
                            color: Color(0xFF2563EB), // blue background
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: SvgPicture.asset('assets/icons/computer.svg',
                              color: Color(0xFFFFFFFF),),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),

                  Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/icons/video.svg'),
                          SizedBox(width: 8,),
                          Text("upcomingScreen.joinSession".tr, // Changed
                            style:TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor),) // Check contrast: if textColor is light, text might be hard to read on primaryColor.
                        ],
                      ))
                ],
              ),
            ),
          );
        },
        separatorBuilder: (__, _)=> SizedBox(height: 12,),
        itemCount: 5); // This suggests the above is placeholder data
  }
}

