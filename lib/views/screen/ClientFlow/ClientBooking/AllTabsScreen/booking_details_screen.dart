import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookingDetailsScreen extends StatefulWidget {
  
  const BookingDetailsScreen({super.key});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Booking Details "),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
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
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12)
            ),
            child:   Column(
              mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text("Coaching Type",
               style: TextStyle(
                 color: AppColors.primaryColor,
                 fontSize: 18,
                 fontWeight: FontWeight.w600,
               ),),
               SizedBox(height: 8,),
               Text("Virtual",
               style: TextStyle(
                 color: AppColors.bigTextColor,
                 fontSize: 16,
                 fontWeight: FontWeight.w500,
               ),),
               // SizedBox(height: 16,),
               // Text("Location",
               //   style: TextStyle(
               //     color: AppColors.primaryColor,
               //     fontSize: 18,
               //     fontWeight: FontWeight.w600,
               //   ),),
               // SizedBox(height: 8,),
               // Text("2972 Westheimer Rd. Santa Ana, Illinois 85486 ",
               //   style: TextStyle(
               //     color: AppColors.bigTextColor,
               //     fontSize: 16,
               //     fontWeight: FontWeight.w500,
               //   ),),
               SizedBox(height: 16,),
               Text("Duration",
                 style: TextStyle(
                   color: AppColors.primaryColor,
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                 ),),
               SizedBox(height: 8,),
               Text("60 min",
                 style: TextStyle(
                   color: AppColors.bigTextColor,
                   fontSize: 16,
                   fontWeight: FontWeight.w500,
                 ),),
               SizedBox(height: 16,),
               Text("Date & Time",
                 style: TextStyle(
                   color: AppColors.primaryColor,
                   fontSize: 18,
                   fontWeight: FontWeight.w600,
                 ),),
               SizedBox(height: 8,),
               Text("Monday, June 15, 10:00 AM",
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
          Text("Price: \$500",
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),),
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
              child: Text("Cancel This Booking",
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
