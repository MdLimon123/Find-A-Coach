import 'package:find_me_a_coach/controllers/coachController/coach_home_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {

  final _coachHomeController = Get.put(CoachHomeController());


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _coachHomeController.fetchCoachUserBooking();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(()=> _coachHomeController.isLoading.value?
    Center(child: CustomPageLoading()):
    ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final session = _coachHomeController.coachUserBookingList[index];
          return Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  Row(
                    children: [

                      CustomNetworkImage(
                          imageUrl: "${ApiConstant.imageBaseUrl}${session.coachImage}",
                          boxShape: BoxShape.circle,
                          height: 40,
                          width: 40),


                      SizedBox(width: 8),
                      Text(
                        session.coachName,
                        style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6ECF3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Color(0xFF00428A), size: 18),
                            SizedBox(width: 6),
                            Text(
                              DateFormat('EEEE, MMM d').format(DateTime.parse(session.sessionDate)),
                              style: TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6),
                          child: SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Color(0xFF4B5563),
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),

                        // Time
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                color: Color(0xFF4B5563), size: 18),
                            SizedBox(width: 6),
                            Text(
                              DateFormat.jm().format(
                                DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  int.parse(session.sessionTime.split(":")[0]),
                                  int.parse(session.sessionTime.split(":")[1]),
                                  int.parse(session.sessionTime.split(":")[2]),
                                ),
                              ),
                              style: TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        // Device Icon
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Color(0xFF002F62),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.computer,
                                  color: Colors.white, size: 18)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(
                              ()=> InkWell(
                            onTap: () {
                              _coachHomeController.declineBooking(session.bookingId);
                            },
                            child: Container(
                              width: double.infinity,
                              height: 44,
                              decoration: BoxDecoration(
                                color: Color(0xFFE6ECF3),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: Color(0xFFE6E7EA), width: 1),
                              ),
                              child: Center(
                                child: _coachHomeController.declineLoading[session.bookingId] ?? false?
                                SpinKitCircle(
                                  color:AppColors.primaryColor,
                                  size: 30,
                                ):
                                Text(
                                  "Decline",
                                  style: TextStyle(
                                      color: Color(0xFF031330),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Obx(
                              ()=> CustomButton(
                            loading: _coachHomeController.bookingLoading[session.bookingId] ?? false,
                            onTap: () {
                              _coachHomeController.bookingAccept(session.bookingId);
                            },
                            text: 'Accept',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ));
        },
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemCount: _coachHomeController.coachUserBookingList.length));
  }
}
