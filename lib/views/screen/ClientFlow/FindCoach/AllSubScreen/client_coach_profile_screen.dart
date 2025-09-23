import 'package:find_me_a_coach/controllers/clientController/find_coach_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/FindCoach/AllSubScreen/booking_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../models/clientModel/single_coach_profile_model.dart';

class ClientCoachProfileScreen extends StatefulWidget {

  final int userId;

  const ClientCoachProfileScreen({super.key, required this.userId});

  @override
  State<ClientCoachProfileScreen> createState() => _ClientCoachProfileScreenState();
}

class _ClientCoachProfileScreenState extends State<ClientCoachProfileScreen> {

  final _findCoachController = Get.put(FindCoachController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _findCoachController.fetchSingleCoachProfile(id: widget.userId);
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Coach Profile"),
      body: Obx((){
        if(_findCoachController.isLoading.value){
          return Center(child: CustomPageLoading(),);
        }
        if(_findCoachController.coachProfile.value == null){
          return Center(child: Text("No Coach Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textColor
          ),));
        }
        final coach = _findCoachController.coachProfile.value!;

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   children: [
              //
              //     CustomNetworkImage(
              //         imageUrl: "${ApiConstant.imageBaseUrl}${coach.image}",
              //         height: 80,
              //         boxShape: BoxShape.circle,
              //         width: 80),
              //
              //     SizedBox(width: 12,),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(coach.fullName,
              //               style: TextStyle(
              //                 color: Color(0xFF1F2937),
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.w600,
              //               ),),
              //             Align(
              //               alignment: Alignment.centerRight,
              //               child: SvgPicture.asset('assets/icons/sava.svg'),
              //             )
              //           ],
              //         ),
              //         Text(coach.certifications.join(","),
              //           style: TextStyle(
              //             color: Color(0xFF374151),
              //             fontSize: 14,
              //             fontWeight: FontWeight.w400,
              //           ),),
              //         Row(
              //           children: [
              //             RatingBar.builder(
              //               initialRating: coach.rating,
              //               minRating: 1,
              //               direction: Axis.horizontal,
              //               allowHalfRating: true,
              //               itemSize: 14,
              //               itemCount: 5,
              //               itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
              //               itemBuilder: (context, _) => Icon(
              //                 Icons.star,
              //                 color: Color(0xFF00428A),
              //                 size: 12,
              //               ),
              //               onRatingUpdate: (rating) {},
              //             ),
              //             SizedBox(width: 4,),
              //             Text("${coach.rating} (${coach.totalRatingCount})",
              //               style: TextStyle(
              //                 color: AppColors.bigTextColor,
              //                 fontSize: 10,
              //                 fontWeight: FontWeight.w400,
              //               ),)
              //           ],
              //         )
              //       ],
              //     )
              //   ],
              // ),
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomNetworkImage(
                imageUrl: "${ApiConstant.imageBaseUrl}${coach.image}",
                height: 80,
                width: 80,
                boxShape: BoxShape.circle,
              ),
               SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            coach.fullName,
                            style: const TextStyle(
                              color: Color(0xFF1F2937),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SvgPicture.asset('assets/icons/sava.svg'),
                      ],
                    ),
                    Text(
                      coach.certifications.join(","),
                      style: const TextStyle(
                        color: Color(0xFF374151),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                          initialRating: coach.rating,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemSize: 14,
                          itemCount: 5,
                          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Color(0xFF00428A),
                            size: 12,
                          ),
                          onRatingUpdate: (_) {},
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${coach.rating} (${coach.totalRatingCount})",
                          style:  TextStyle(
                            color: AppColors.bigTextColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),


          SizedBox(height: 20,),
              _buildRow(
                image: 'assets/icons/location.svg',
                text: 'From: ${coach.location}}',
              ),
              SizedBox(height: 8,),
              _buildRow(
                image: 'assets/icons/global.svg',
                text: 'Languages: ${coach.languagesSpoken.join(", ")}',
              ),
              SizedBox(height: 8,),
              _buildRow(
                image: 'assets/icons/computer.svg',
                text: 'Coaching Format: ${coach.sessionFormat}',
              ),
              SizedBox(height: 20,),
              Text("About Coach".tr,
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),),
              SizedBox(height: 8,),
              Text(coach.bio,
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
              _buildConsiderationRow(
                  label: "Neurodiversity Affirming",
                  value: coach.neurodiversityAffirming),
              _buildConsiderationRow(
                  label: "LGBTQIA+ Affirming", value: coach.lgbtqiaAffirming),
              _buildConsiderationRow(
                  label: "Gender Sensitive", value: coach.genderSensitive),
              _buildConsiderationRow(
                  label: "Trauma Sensitive", value: coach.traumaSensitive),
              _buildConsiderationRow(
                  label: "Faith-Based Approach", value: coach.faithBased),

              SizedBox(height: 20,),
              Text("Website and Social Links",
                style: TextStyle(
                  color: Color(0xFF1F2937),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),
              SizedBox(height: 8,),
              _buildLinkRow(coach.personalWebsite),
              SizedBox(height: 8,),
              _buildLinkRow(coach.linkedinProfile),
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
              buildAvailabilitySection(coach.availability),

              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(12),
              //   decoration: BoxDecoration(
              //       color: AppColors.textColor,
              //       borderRadius: BorderRadius.circular(12)
              //   ),
              //   child: Column(
              //     children: [
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text("19 July, 2025",
              //             style: TextStyle(
              //               color: Color(0xFF1F2937),
              //               fontSize: 16,
              //               fontWeight: FontWeight.w400,
              //             ),),
              //           SvgPicture.asset('assets/icons/calender.svg')
              //         ],
              //       ),
              //       SizedBox(height: 18,),
              //       Row(
              //         children: [
              //           Expanded(
              //             child: Container(
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               height: 36,
              //               decoration: BoxDecoration(
              //                   color: Color(0xFFE6ECF3),
              //                   borderRadius: BorderRadius.circular(4),
              //                   border: Border.all(color: Color(0xFF3368A1),
              //                       width: 0.5)
              //               ),
              //               child: Text("9:00 AM-10:00 AMt",
              //                 style: TextStyle(
              //                   color: Color(0xFF3368A1),
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w400,
              //                 ),),
              //             ),
              //           ),
              //           SizedBox(width: 10,),
              //           Expanded(
              //             child: Container(
              //               width: double.infinity,
              //               alignment: Alignment.center,
              //               height: 36,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(4),
              //                   color: Color(0xFFE6ECF3),
              //                   border: Border.all(color: Color(0xFF3368A1),
              //                       width: 0.5)
              //               ),
              //               child: Text("11:00 AM-12:00 PM",
              //                 style: TextStyle(
              //                   color: Color(0xFF3368A1),
              //                   fontSize: 14,
              //                   fontWeight: FontWeight.w400,
              //                 ),),
              //             ),
              //           ),
              //         ],
              //       ),
              //       // Add more time rows similarly if needed
              //     ],
              //   ),
              // ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('Pricing: \$${coach.pricePerSession.toInt()} ',
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

                      print("availability =======> ${coach.availability}");


                      Get.to(() => BookingScreen(
                        coachId: coach.userId,
                        coachingAreas: coach.coachingAreas ?? [],
                        fullName: coach.fullName,
                        image: coach.image,
                        certifications: coach.certifications.join(","),
                        rating: coach.rating,
                        totalRatingCount: coach.totalRatingCount,
                        languagesSpoken: coach.languagesSpoken.join(","),
                        sessionFormat: coach.sessionFormat,
                        availability: coach.availability,
                        pricePerSession: coach.pricePerSession,
                        location: coach.location,
                      ));

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
        );
      }),
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

  Widget _buildConsiderationRow({required String label, required bool value}) {
    return Row(
      children: [
        Text(
          "$label:",
          style: TextStyle(
            color: Color(0xFF4B5563),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 4),
        SvgPicture.asset(
          value ? 'assets/icons/tik.svg' : 'assets/icons/close.svg',
          height: 16,
          width: 16,
        )
      ],
    );
  }

  Widget _buildLinkRow(String url) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/attach.svg',
          color: Color(0xFF4B5563),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            url,
            style: TextStyle(
              color: Color(0xFF4B5563),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
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
