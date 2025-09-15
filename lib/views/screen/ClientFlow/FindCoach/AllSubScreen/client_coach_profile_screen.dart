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
      appBar: CustomAppbar(title: "Coach Profile"),
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
                    Text("Maria Hernandez",
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),),
                    Text("Certified Career Coach by ICF",
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
                        Text("4.8 (120)",
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
              text: 'From New York, USA',
            ),
            SizedBox(height: 8,),
            _buildRow(
              image: 'assets/icons/global.svg',
              text: 'Languages: English, Spanish',
            ),
            SizedBox(height: 8,),
            _buildRow(
              image: 'assets/icons/computer.svg',
              text: 'Coaching Format: Virtual',
            ),
            SizedBox(height: 20,),
            Text("About Coach".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),),
            SizedBox(height: 8,),
            Text("With over 10 years of experience, Coach Maria specializes in helping clients transition into new careers, refine their professional skills, and achieve their career goals",
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),),
            SizedBox(height: 20,),
            Text("Special Considerations",
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 8,),
            Row(
              children: [
                Text("Neurodiversity Affirming:",
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
                Text("LGBTQIA+ Affirming:",
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
                Text("Gender Sensitive:",
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
                Text("Trauma Sensitive:",
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
                Text("Faith-Based Approach:",
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
                SvgPicture.asset('assets/icons/tik.svg')
              ],
            ),
            SizedBox(height: 20,),
            Text("Website and Social Links",
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
                Text("www.website.com",
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
                Text("www.linkedin.com/in/maria.hernandez",
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
                Text("instagram.com/maria.hernandez".tr,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),),
              ],
            ),
            SizedBox(height: 20,),
            Text("Availability",
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
                      Text("19 July, 2025",
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
                          child: Text("9:00 AM-10:00 AMt",
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
                          child: Text("11:00 AM-12:00 PM",
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
                Text('Pricing: \$500 ',
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),),
                Text('per session',
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
                      text: 'Book a Session'),
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
