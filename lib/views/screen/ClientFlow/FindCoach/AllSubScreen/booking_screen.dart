import 'package:find_me_a_coach/controllers/clientController/find_coach_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/customSnackbar.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/base/get_availability.dart';
import 'package:find_me_a_coach/views/base/get_next_day.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../models/clientModel/single_coach_profile_model.dart';

class BookingScreen extends StatefulWidget {

  final int coachId;
  final List<int> coachingAreas;
  final String fullName;
  final String image;
  final String certifications;
  final double rating;
  final int totalRatingCount;
  final String languagesSpoken;
  final String sessionFormat;
  final Availability availability;
  final double pricePerSession;
  final String location;

  const BookingScreen({super.key,
    required this.coachId,
    required this.fullName,
    required this.image,
    required this.certifications,
    required this.rating,
    required this.totalRatingCount,
    required this.languagesSpoken,
    required this.sessionFormat,
    required this.availability,
    required this.pricePerSession,
    required this.location,
    required this.coachingAreas,
  });

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  final coachTextController = TextEditingController();
  final durationTextController = TextEditingController();

  final _findCoachController = Get.put(FindCoachController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Booking"),
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

                  CustomNetworkImage(
                      imageUrl: "${ApiConstant.imageBaseUrl}${widget.image}",
                      height: 80,
                      boxShape: BoxShape.circle,
                      width: 80),


                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.fullName,
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        widget.certifications,
                        style: TextStyle(
                          color: Color(0xFF374151),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating: widget.rating,
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
                            "${widget.rating} (${widget.totalRatingCount})",
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
              label: "Coaching Format",
              hint: widget.sessionFormat,
              controller: coachTextController,
              suffix: Icon(Icons.keyboard_arrow_down_rounded,
                  color: Color(0xFF4B5563)),
            ),
            SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.textColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Duration",
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),),
              SizedBox(height: 12),
              CustomTextField(controller: durationTextController,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    'assets/icons/arrow_up_down.svg',
                    color: Color(0xFF4B5563),
                  ),
                ),
                hintText: "Duration",),
            ],
          ),
        ),


            SizedBox(height: 12),
            buildAvailabilitySection(widget.availability),
            SizedBox(height: 12),
            Text(
              "Price: ${widget.pricePerSession}",
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 32),
            Obx(
                  () => CustomButton(
                loading: _findCoachController.isLoading.value,
                onTap: () {
                  final slot = getFirstAvailableSlot(widget.availability);

                  if (slot != null) {
                    final dayName = getDayNameOfSlot(widget.availability, slot);

                    _findCoachController.addBooking(
                      coachId: widget.coachId,
                      coachingArea: widget.coachingAreas.isNotEmpty
                          ? widget.coachingAreas.first
                          : 0,
                      duration: durationTextController.text,
                      date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
                      time: slot.from,
                      sessionFormat: widget.sessionFormat,
                      price: widget.pricePerSession,
                    );
                  } else {
                    showCustomSnackBar("No available slots");
                  }
                },
                text: "Confirm Booking",
              ),
            )

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
            readOnly: true,
            controller: controller,
            hintText: hint,
            suffixIcon: suffix,
          ),
        ],
      ),
    );
  }

  Widget buildAvailabilitySection(Availability availability) {

    final List<TimeSlot> allSlots = [];
    availability.toJson().forEach((day, list) {
      for (var s in list ?? []) {
        allSlots.add(TimeSlot.fromJson(s));
      }
    });


    List<Widget> rows = [];
    for (var i = 0; i < allSlots.length; i += 2) {
      final first = allSlots[i];
      final second = (i + 1 < allSlots.length) ? allSlots[i + 1] : null;

      rows.add(
        Row(
          children: [
            Expanded(child: _timeBox("${first.from} - ${first.to}")),
            const SizedBox(width: 10),
            Expanded(
              child: second != null
                  ? _timeBox("${second.from} - ${second.to}")
                  : const SizedBox(),
            ),
          ],
        ),
      );

      rows.add(const SizedBox(height: 10));
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.textColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                DateFormat("d MMM, yyyy").format(DateTime.now()),
                style: const TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SvgPicture.asset('assets/icons/calender.svg'),
            ],
          ),
          const SizedBox(height: 18),
          ...rows,
        ],
      ),
    );
  }

  Widget _timeBox(String text) {
    return Container(
      alignment: Alignment.center,
      height: 36,
      decoration: BoxDecoration(
        color: const Color(0xFFE6ECF3),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF3368A1), width: 0.5),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF3368A1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
