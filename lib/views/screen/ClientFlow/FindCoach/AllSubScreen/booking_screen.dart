import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

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
      appBar: CustomAppbar(title: "bookingScreen.title".tr),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/person.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "bookingScreen.coachName".tr,
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "bookingScreen.coachTitle".tr,
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 14,
                            itemCount: 5,
                            itemPadding:
                            EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFF00428A),
                              size: 12,
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          SizedBox(width: 4),
                          Text(
                            "bookingScreen.coachRating".tr,
                            style: TextStyle(
                              color: AppColors.bigTextColor,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            _customInputSection(
              label: "bookingScreen.coachingFormat".tr,
              hint: "bookingScreen.selectCoachingFormat".tr,
              controller: coachTextController,
              suffix: Icon(Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF4B5563)),
            ),
            SizedBox(height: 12),
            _customInputSection(
              label: "bookingScreen.duration".tr,
              hint: "bookingScreen.durationValue".tr,
              controller: durationTextController,
              suffix: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SvgPicture.asset(
                  'assets/icons/arrow_up_down.svg',
                  color: Color(0xFF4B5563),
                ),
              ),
            ),
            SizedBox(height: 12),
            _bookingTimeSection(),
            SizedBox(height: 12),
            Text(
              "bookingScreen.pricing".trParams({'price': '500'}),
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            CustomButton(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Column(
                        children: [
                          Image.asset('assets/images/confirm.png'),
                          SizedBox(height: 16),
                          Text(
                            "bookingScreen.bookingConfirmed".tr,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF1F2937)),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              text: "bookingScreen.confirmBooking".tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget _customInputSection({
    required String label,
    required String hint,
    required TextEditingController controller,
    required Widget suffix,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.textColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF4B5563),
            ),
          ),
          SizedBox(height: 8),
          CustomTextField(
            controller: controller,
            hintText: hint,
            suffixIcon: suffix,
          ),
        ],
      ),
    );
  }

  Widget _bookingTimeSection() {
    List<String> times = [
      "bookingScreen.timeSlot1".tr,
      "bookingScreen.timeSlot2".tr,
      "bookingScreen.timeSlot3".tr,
      "bookingScreen.timeSlot4".tr,
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.textColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("bookingScreen.date".tr),
              SvgPicture.asset('assets/icons/calender.svg'),
            ],
          ),
          SizedBox(height: 18),
          for (int i = 0; i < times.length; i += 2)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Expanded(child: _timeSlot(times[i])),
                  SizedBox(width: 10),
                  Expanded(
                      child: i + 1 < times.length ? _timeSlot(times[i + 1]) : Container()),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _timeSlot(String time) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 36,
      decoration: BoxDecoration(
        color: Color(0xFFE6ECF3),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xFF3368A1), width: 0.5),
      ),
      child: Text(
        time,
        style: TextStyle(
          color: Color(0xFF3368A1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
