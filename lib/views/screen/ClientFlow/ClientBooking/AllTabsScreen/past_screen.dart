import 'package:find_me_a_coach/controllers/clientController/client_booking_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/date_time_formate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class PastScreen extends StatefulWidget {
  const PastScreen({super.key});

  @override
  State<PastScreen> createState() => _PastScreenState();
}

class _PastScreenState extends State<PastScreen> {

  final _clientBookingController = Get.put(ClientBookingController());

  @override
  void initState() {
    _clientBookingController.fetchPastSessions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> _clientBookingController.pastSessionLoading.value?
    Center(child: CustomPageLoading()):
    ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemBuilder: (context, index){
          final pastList = _clientBookingController.passSessionList[index];
          final booking = pastList;
          final parts = formatSessionParts(
              booking.sessionDate,
              booking.sessionTime
          );
          final dateText = parts['dateText'];
          final timeText = parts['timeText'];

          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            decoration: BoxDecoration(
                color: Color(0xFFE5E7EB),
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

                    CustomNetworkImage(
                        imageUrl: "${ApiConstant.imageBaseUrl}${pastList.coachImage}",
                        height: 50,
                        boxShape: BoxShape.circle,
                        width: 50),

                    SizedBox(width: 4,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(pastList.coachName, // Changed
                          style: TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 16,
                              fontWeight: FontWeight.w500
                          ),),
                        SizedBox(height: 4,),
                        Text(pastList.coachingAreaName, // Changed
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
                    color: Color(0xFFF3F4F6), // light background
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
                            dateText!, // Changed
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
                            timeText!, // Changed
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
                          padding: const EdgeInsets.all(2.0),
                          child: SvgPicture.asset('assets/icons/community.svg',
                            color: Color(0xFFFFFFFF),),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16,),
                pastList.status == "confirmed"? InkWell(
                  onTap: (){
                    showDialog(context: context,
                        builder:(context)=> AlertDialog(
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("pastScreen.rateYourSession".tr, // Changed
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1F2937)
                                ),),
                              SizedBox(height: 16,),

                              RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemPadding: EdgeInsets.symmetric(horizontal: 8),
                                  itemSize: 30,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(Icons.star,
                                    color: Color(0xFFFB9506),),
                                  onRatingUpdate: (rating) {

                                  }),
                              SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell( // Added InkWell for tap
                                      onTap: () => Navigator.of(context).pop(), // Close dialog
                                      child: Container(
                                        width: double.infinity,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE6ECF3),
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Color(0xFFE6E7EA),
                                              width: 1),
                                        ),
                                        child: Center(
                                          child: Text('pastScreen.cancel'.tr, // Changed
                                            style: TextStyle(
                                                color: Color(0xFF031330),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12,),
                                  Expanded(
                                    child: InkWell( // Added InkWell for tap
                                      onTap: () {
                                        // TODO: Implement submit rating logic
                                        Navigator.of(context).pop(); // Close dialog
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: Color(0xFFFFFFFF),
                                              width: 1),
                                        ),
                                        child: Center(
                                          child: Text('Submit', // Changed
                                            style: TextStyle(
                                                color: Color(0xFFFFFFFF), // Assuming AppColors.textColor is white for primaryColor bg
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                  },
                  child: Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Center(
                        child: Text("pastScreen.leaveAReview".tr, // Changed
                          style:TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textColor), // Check contrast
                        ),
                      )),
                ):
                SizedBox()
              ],
            ),
          );
        },
        separatorBuilder: (__, _)=> SizedBox(height: 12,),
        itemCount: _clientBookingController.passSessionList.length));
  }
}
