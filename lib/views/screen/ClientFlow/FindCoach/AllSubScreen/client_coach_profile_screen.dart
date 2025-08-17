import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/FindCoach/AllSubScreen/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientCoachProfileScreen extends StatefulWidget {
  const ClientCoachProfileScreen({super.key});

  @override
  State<ClientCoachProfileScreen> createState() => _ClientCoachProfileScreenState();
}

class _ClientCoachProfileScreenState extends State<ClientCoachProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "coachProfileScreen.title".tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/person.jpg'),
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(width: 12,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("maria_hernandez".tr,
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),),
                    Text("career_coach".tr,
                      style: TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 14,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Color(0xFF00428A),
                            size: 12,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        SizedBox(width: 4,),
                        Text("coachProfileScreen.ratingValue".tr,
                          style: TextStyle(
                            color: AppColors.bigTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),)
                      ],
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            _buildRow(
              image: 'assets/icons/location.svg',
              text: 'coachProfileScreen.location'.tr,
            ),
            SizedBox(height: 8,),
            _buildRow(
              image: 'assets/icons/global.svg',
              text: 'coachProfileScreen.languages'.tr,
            ),
            SizedBox(height: 8,),
            _buildRow(
              image: 'assets/icons/computer.svg',
              text: 'coachProfileScreen.coachingFormat'.tr,
            ),
            SizedBox(height: 20,),
            Text("coachProfileScreen.aboutCoach".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8,),
            Text("coachProfileScreen.aboutCoachDescription".tr,
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),),
            SizedBox(height: 20,),
            Text("coachProfileScreen.specialConsiderations".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("coachProfileScreen.neurodiversityAffirming".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("coachProfileScreen.lgbtqAffirming".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("coachProfileScreen.genderSensitive".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("coachProfileScreen.traumaSensitive".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/close.svg')
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("coachProfileScreen.faithBasedApproach".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 20,),
            Text("coachProfileScreen.websiteAndSocial".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 8,),
            Row(
              children: [
                SvgPicture.asset('assets/icons/attach.svg',
                  color: Color(0xFF4B5563),),
                SizedBox(width: 8,),
                Text("coachProfileScreen.websiteUrl".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                SvgPicture.asset('assets/icons/attach.svg',
                  color: Color(0xFF4B5563),),
                SizedBox(width: 8,),
                Text("coachProfileScreen.linkedinUrl".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),),
              ],
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                SvgPicture.asset('assets/icons/attach.svg',
                  color: Color(0xFF4B5563),),
                SizedBox(width: 8,),
                Text("coachProfileScreen.instagramUrl".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
              ],
            ),
            SizedBox(height: 20,),
            Text("coachProfileScreen.availability".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 8,),
            // Availability container remains same, time slots can also be localized if needed
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("coachProfileScreen.dateExample".tr,
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),),
                      SvgPicture.asset('assets/icons/calender.svg')
                    ],
                  ),
                  SizedBox(height: 18,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 36,
                          decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0xFF3368A1),
                                  width: 0.5)
                          ),
                          child: Text("coachProfileScreen.timeSlot".tr,
                            style: TextStyle(
                              color: Color(0xFF3368A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 36,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Color(0xFFE6ECF3),
                              border: Border.all(color: Color(0xFF3368A1),
                                  width: 0.5)
                          ),
                          child: Text("coachProfileScreen.timeSlot".tr,
                            style: TextStyle(
                              color: Color(0xFF3368A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ),
                    ],
                  ),
                  // Add more time rows similarly if needed
                ],
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('coachProfileScreen.pricing'.trArgs(['500']),
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),),
                Text('coachProfileScreen.perSession'.tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),)
              ],
            ),
            SizedBox(height: 32,),
            Row(
              children: [
                Expanded(
                  child: CustomButton(onTap: (){
                    Get.to(()=> BookingScreen());
                  },
                      text: 'coachProfileScreen.bookSession'.tr),
                ),
                SizedBox(width: 12,),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFFE6ECF3),
                    shape: BoxShape.circle,
                    border: Border.all(color: Color(0xFFB0C4DB), width: 2),
                  ),
                  child: SvgPicture.asset('assets/icons/comment.svg',
                    height: 20,
                    width: 20,),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildRow({required String image, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 4,),
        Text(text,
          style: TextStyle(
            color: Color(0xFF4B5563),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),)
      ],
    );
  }
}
