import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart'; // Import GetX

class BookingDetailsScreen extends StatefulWidget {

  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    String examplePrice = "\$500";

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "bookingDetailsScreen.appBarTitle".tr), // Changed
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.textColor, // Check contrast if textColor is light
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
                Expanded( // Added Expanded to prevent overflow for long names/titles
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("bookingDetailsScreen.coachNameExample".tr, // Changed
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),),
                      Text("bookingDetailsScreen.coachCertificationExample".tr, // Changed
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 3, // This would be dynamic
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
                              // Not typically interactive in a details screen unless it's for user to rate
                            },
                          ),
                          SizedBox(width: 4,),
                          Text("4.8 (120)", // This is typically dynamic data
                            style: TextStyle(
                              color: AppColors.bigTextColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),)
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 12,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.textColor, // Check contrast if textColor is light
                borderRadius: BorderRadius.circular(12)
            ),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("bookingDetailsScreen.coachingType".tr, // Changed
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                SizedBox(height: 8,),
                Text("bookingDetailsScreen.coachingTypeValueVirtual".tr, // Changed (if this is a fixed value)
                  style: TextStyle(
                    color: AppColors.bigTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                // SizedBox(height: 16,),
                // Text("Location", // This was commented out
                //   style: TextStyle(
                //     color: AppColors.primaryColor,
                //     fontSize: 18,
                //     fontWeight: FontWeight.w600,
                //   ),),
                // SizedBox(height: 8,),
                // Text("2972 Westheimer Rd. Santa Ana, Illinois 85486 ", // This was commented out
                //   style: TextStyle(
                //     color: AppColors.bigTextColor,
                //     fontSize: 16,
                //     fontWeight: FontWeight.w500,
                //   ),),
                SizedBox(height: 16,),
                Text("bookingDetailsScreen.duration".tr, // Changed
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                SizedBox(height: 8,),
                Text("bookingDetailsScreen.durationValue60min".tr, // Changed (if this is a fixed value)
                  style: TextStyle(
                    color: AppColors.bigTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                SizedBox(height: 16,),
                Text("bookingDetailsScreen.dateTime".tr, // Changed
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),),
                SizedBox(height: 8,),
                Text("bookingDetailsScreen.dateTimeValueExample".tr, // Changed (if this is a fixed or example value)
                  style: TextStyle(
                    color: AppColors.bigTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),),
                SizedBox(height: 16,),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Text(
            "${"bookingDetailsScreen.priceLabel".tr} $examplePrice", // Changed & interpolated
            style: TextStyle(
              color: Color(0xFF1F2937),
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 32,),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xFFE6ECF3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFB0C4DB))
            ),
            child: Center(
              child: Text("bookingDetailsScreen.cancelBookingButton".tr, // Changed
                style: TextStyle(
                  color: Color(0xFF00428A),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),),
            ),
          )
        ],
      ),
    );
  }
}
