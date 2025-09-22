import 'package:find_me_a_coach/controllers/clientController/client_booking_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/date_time_formate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BookingDetailsScreen extends StatefulWidget {
 final int id;
  const BookingDetailsScreen({super.key, required this.id});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {

  final _clientBookingController = Get.put(ClientBookingController());

  @override
  void initState() {
    _clientBookingController.fetchBookingDetails(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "bookingDetailsScreen.appBarTitle".tr),
      body: Obx((){
        if(_clientBookingController.bookingDetailsLoading.value){
          return Center(child: CustomPageLoading());
        }
        if(_clientBookingController.bookingDetailsList.isEmpty){
          return Center(child: Text("No Data Found",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w500
          ),));
        }
        final bookingDetails = _clientBookingController.bookingDetailsList.first;
        final booking = bookingDetails;
        final parts = formatSessionParts(
            booking.sessionDate,
            booking.sessionTime
        );
        final dateText = parts['dateText'];
        final timeText = parts['timeText'];
       return ListView(
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

                  CustomNetworkImage(
                      imageUrl: "${ApiConstant.imageBaseUrl}${bookingDetails.coachImage}",
                      height: 80,
                      boxShape: BoxShape.circle,
                      width: 80),


                  SizedBox(width: 8,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(bookingDetails.coachName,
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),),
                        Text(bookingDetails.coachingAreaName,
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: bookingDetails.rating,
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
                            Text("${bookingDetails.rating} (${bookingDetails.totalRatingCount})",
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
                  color: AppColors.textColor,
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
                  Text(bookingDetails.sessionFormat,
                    style: TextStyle(
                      color: AppColors.bigTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
                  SizedBox(height: 16,),
                  if(bookingDetails.sessionFormat == "in-person")
                    Text("Location", // This was commented out
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),),
                  SizedBox(height: 8,),
                  if(bookingDetails.sessionFormat == "in-person")
                  Text("2972 Westheimer Rd. Santa Ana, Illinois 85486 ", /// This was commented out
                    style: TextStyle(
                      color: AppColors.bigTextColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),),
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
                  Text("$dateText , $timeText", // Changed (if this is a fixed or example value)
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
              "Price \$${bookingDetails.price}", // Changed & interpolated
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
        );
      }
     ),
    );
  }
}
