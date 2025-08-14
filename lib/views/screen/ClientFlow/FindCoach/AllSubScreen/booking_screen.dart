import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  
  final coachTextController = TextEditingController();
  final durationTextController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Booking"),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child:   Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                            fit: BoxFit.cover)
                    ),

                  ),
                  SizedBox(width: 8,),
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
                            onRatingUpdate: (rating) {

                            },
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

            ),
            SizedBox(height: 12,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Coaching Format",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4B5563)
                  ),),
                  SizedBox(height: 8,),
                  CustomTextField(controller: coachTextController,
                    hintText: 'Select coaching formate',
                    suffixIcon: Icon(Icons.keyboard_arrow_down_rounded,
                      color: Color(0xFF4B5563),),)
                ],
              )
              ),
            SizedBox(height: 12,),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Duration",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563)
                      ),),
                    SizedBox(height: 8,),
                    CustomTextField(controller: coachTextController,
                      hintText: '60 min',
                      suffixIcon:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset('assets/icons/arrow_up_down.svg',
                        color: Color(0xFF4B5563),),
                      ))
                  ],
                )
            ),
            SizedBox(height: 12,),
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
                      Text("19 July",
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
                          child: Text("9:00 AM-10:00 AM",
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
                          child: Text("9:00 AM-10:00 AM",
                            style: TextStyle(
                              color: Color(0xFF3368A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
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
                          child: Text("9:00 AM-10:00 AM",
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
                          child: Text("9:00 AM-10:00 AM",
                            style: TextStyle(
                              color: Color(0xFF3368A1),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12,),
            Text('Pricing: \$500',
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
            SizedBox(height: 32,),
            CustomButton(onTap: (){
              showDialog(context: context,
                  builder: (context){
                return AlertDialog(
                  title: Column(
                    children: [
                      Image.asset('assets/images/confirm.png'),
                      SizedBox(height: 16,),
                      Text("Booking Confirmed",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937)
                      ),)
                    ],
                  ),
                );
                  });
            },
                text: "Confirm Booking")
          ],
        ),
      ),
    );
  }
}
