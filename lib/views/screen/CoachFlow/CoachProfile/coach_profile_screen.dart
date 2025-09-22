import 'package:find_me_a_coach/controllers/coachController/coach_profile_controller.dart';
import 'package:find_me_a_coach/models/coachModel/coach_profile_model.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/settings_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachProfile/edit_personal_info_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachSetting/coach_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoachProfileScreen extends StatefulWidget {
  const CoachProfileScreen({super.key});

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {

  final _coachProfileController = Get.put(CoachProfileController());

  @override
  void initState() {
    _coachProfileController.fetchCoachProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.textColor,
          automaticallyImplyLeading: false,
          title: Row(
            spacing: 12,
            children: [
              Image.asset('assets/images/app_logo1.png'),
              Spacer(),
              _customContainer(
                  onTap: () {
                    Get.to(() => CoachAiChatScreen());
                  },
                  image: 'assets/icons/cross.svg'),
              _customContainer(
                  onTap: () {
                    Get.to(() => NotificationScreen());
                  },
                  image: 'assets/icons/notification.svg'),
              _customContainer(
                  onTap: () {
                    Get.to(() => CoachSettingsScreen());
                  },
                  image: 'assets/icons/settings.svg'),
            ],
          )),
      body: Obx((){
        if(_coachProfileController.isLoading.value){
          return Center(child: CustomPageLoading());
        }
        final coachProfile = _coachProfileController.coachProfile.value;
        final availabilityList = coachProfile?.availability['W'] ?? [];

        if(coachProfile == null){
          return Center(child: Text('No Data Found'));
        }

        return SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  coachProfile.image.isNotEmpty?
                      CustomNetworkImage(
                          imageUrl: "${ApiConstant.imageBaseUrl}${coachProfile.image}",
                          height: 80,
                          boxShape: BoxShape.circle,
                          width: 80):

                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/images/person.jpg'),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(coachProfile.fullName,
                          style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          )),
                      Text("${coachProfile.coachingAreaNames.join(',')} Coach",
                          style: TextStyle(
                            color: Color(0xFF374151),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          )),
                      // Row(
                      //   children: [
                      //     RatingBar.builder(
                      //       initialRating: 3,
                      //       minRating: 1,
                      //       direction: Axis.horizontal,
                      //       allowHalfRating: true,
                      //       itemSize: 14,
                      //       itemCount: 5,
                      //       itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                      //       itemBuilder: (context, _) => Icon(
                      //         Icons.star,
                      //         color: Color(0xFF00428A),
                      //         size: 12,
                      //       ),
                      //       onRatingUpdate: (rating) {},
                      //     ),
                      //     SizedBox(width: 4),
                      //     Text("coachProfile.rating".tr,
                      //         style: TextStyle(
                      //           color: AppColors.bigTextColor,
                      //           fontSize: 10,
                      //           fontWeight: FontWeight.w400,
                      //         ))
                      //   ],
                      // )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              _buildRow(
                  image: 'assets/icons/location.svg',
                  text: 'From ${coachProfile.location}'),
              SizedBox(height: 8),
              _buildRow(
                  image: 'assets/icons/global.svg',
                  text: 'Languages: ${coachProfile.languagesSpoken.join(', ')}'),
              SizedBox(height: 8),
              _buildRow(
                  image: 'assets/icons/computer.svg',
                  text: 'Coaching Format: ${coachProfile.sessionFormat}'),
              SizedBox(height: 20),
              Text("About Coach",
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 8),
              Text(coachProfile.bio,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              SizedBox(height: 20),
              Text("Website and Social Links".tr,
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 8),
              if(coachProfile.personalWebsite.isNotEmpty)
              Row(
                children: [
                  SvgPicture.asset('assets/icons/attach.svg',
                      color: Color(0xFF4B5563)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(coachProfile.personalWebsite,
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              if(coachProfile.linkedinProfile.isNotEmpty)
              Row(
                children: [
                  SvgPicture.asset('assets/icons/attach.svg',
                      color: Color(0xFF4B5563)),
                  SizedBox(width: 8),
                  Text(coachProfile.linkedinProfile,
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset('assets/icons/attach.svg',
                      color: Color(0xFF4B5563)),
                  SizedBox(width: 8),
                  Text("instagram.com/maria.hernandez",
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Text("Availability",
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  )),
              SizedBox(height: 8),

              Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(12)),
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
                            )),
                        SvgPicture.asset('assets/icons/calender.svg')
                      ],
                    ),
                    SizedBox(height: 18),


                    ...List.generate((availabilityList.length / 2).ceil(), (rowIndex) {
                      final firstIndex = rowIndex * 2;
                      final secondIndex = firstIndex + 1;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            // First slot
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                height: 36,
                                decoration: BoxDecoration(
                                    color: Color(0xFFE6ECF3),
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(color: Color(0xFF3368A1), width: 0.5)),
                                child: Text(
                                  "${availabilityList[firstIndex].from} - ${availabilityList[firstIndex].to}".tr,
                                  style: TextStyle(
                                    color: Color(0xFF3368A1),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),

                            // Second slot if exists
                            if (secondIndex < availabilityList.length)
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  alignment: Alignment.center,
                                  height: 36,
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE6ECF3),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: Color(0xFF3368A1), width: 0.5)),
                                  child: Text(
                                    "${availabilityList[secondIndex].from} - ${availabilityList[secondIndex].to}".tr,
                                    style: TextStyle(
                                      color: Color(0xFF3368A1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            if (secondIndex >= availabilityList.length)
                              Expanded(child: Container()), // empty for odd number of slots
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),




              SizedBox(height: 20),
              Row(
                children: [
                  Text('Pricing:',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      )),
                  Text('\$500 per session',
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ))
                ],
              ),
              SizedBox(height: 32),
              CustomButton(
                  onTap: () {
                    Get.to(() => EditPersonalInfoScreen());
                  },
                  text: 'Edit')
            ],
          ),
        );
      }),
      bottomNavigationBar: CoachBottomMenu(4),
    );
  }

  _buildRow({required String image, required String text}) {
    return Row(
      children: [
        SvgPicture.asset(image),
        SizedBox(width: 4),
        Text(text,
            style: TextStyle(
              color: Color(0xFF4B5563),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ))
      ],
    );
  }

  _customContainer({required String image, required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFF5480B1), width: 0.8),
            boxShadow: [
              BoxShadow(
                color: Color(0xFF1D4760).withOpacity(0.018),
                blurRadius: 2.2,
                offset: Offset(0, 3),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }

  String dayToFullName(String code) {
    switch (code) {
      case "M": return "Monday";
      case "T": return "Tuesday";
      case "W": return "Wednesday";
      case "Th": return "Thursday";
      case "F": return "Friday";
      case "Sa": return "Saturday";
      case "Su": return "Sunday";
      default: return code;
    }
  }

  List<Widget> _buildSlotRows(List<CoachAvailability> slots) {
    List<Widget> rows = [];

    for (int i = 0; i < slots.length; i += 2) {
      rows.add(
        Row(
          children: [
            Expanded(
              child: _buildSlotContainer(slots[i]),
            ),
            SizedBox(width: 10),
            if (i + 1 < slots.length)
              Expanded(child: _buildSlotContainer(slots[i + 1])),
            if (i + 1 >= slots.length)
              Expanded(child: Container()), // empty if odd number
          ],
        ),
      );
      rows.add(SizedBox(height: 10));
    }

    return rows;
  }

  Widget _buildSlotContainer(CoachAvailability slot) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 36,
      decoration: BoxDecoration(
        color: Color(0xFFE6ECF3),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xFF3368A1), width: 0.5),
      ),
      child: Text("${slot.from} - ${slot.to}",
          style: TextStyle(
            color: Color(0xFF3368A1),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          )),
    );
  }


}
