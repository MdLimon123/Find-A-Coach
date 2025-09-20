import 'package:find_me_a_coach/controllers/clientController/client_profile_controller.dart';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/AllSubScreen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final _clientProfileController = Get.put(ClientProfileController());
  final _dataController = Get.put(DataController());

  @override
  void initState() {

    loadData();
    super.initState();
  }

  void loadData()async{
    await _dataController.getUserData();
    print("user id ============> ${_dataController.id.value}");
    _clientProfileController.fetchProfile(id: _dataController.id.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "profile.title".tr),
      body: Obx((){
        if(_clientProfileController.isProfileLoading.value){
          return Center(child: CustomPageLoading());
        }
        if(_clientProfileController.clientProfile.value == null ){
          return Center(child: Text("No Profile",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor
            ),));

        }
        final coach = _clientProfileController.clientProfile.value!;
        return ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            Row(
              children: [

                CustomNetworkImage(
                    imageUrl:"${ApiConstant.imageBaseUrl}${coach.image}",
                    height: 80,
                    boxShape: BoxShape.circle,
                    width: 80),

                SizedBox(width: 12),
                Text(coach.fullName,
                  style: TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SvgPicture.asset('assets/icons/location.svg'),
                SizedBox(width: 8),
                Text("${"profile.from".tr}: ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4B5563)
                  ),
                ),
                SizedBox(width: 8),
                Text(coach.location!,
                  style: TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            // Row(
            //   children: [
            //     SvgPicture.asset('assets/icons/global.svg'),
            //     SizedBox(width: 8),
            //     Text("${"profile.languages".tr}:",
            //       style: TextStyle(
            //           fontSize: 16,
            //           fontWeight: FontWeight.w400,
            //           color: Color(0xFF4B5563)
            //       ),
            //     ),
            //     SizedBox(width: 8),
            //     Text(coach.languagesSpoken.join,
            //       style: TextStyle(
            //         color: Color(0xFF4B5563),
            //         fontSize: 18,
            //         fontWeight: FontWeight.w500,
            //       ),
            //     )
            //   ],
            // ),
            SizedBox(height: 20),
            Text("profile.bio".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(coach.bio!,
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("${"profile.ethnicity".tr}:",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4B5563)
                  ),
                ),
                SizedBox(width: 4),
                Text(coach.ethnicity!,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563)
                  ),
                )
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text("${"profile.sexualOrientation".tr}:",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4B5563)
                  ),
                ),
                SizedBox(width: 4),
                Text(coach.sexualOrientation!,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF4B5563)
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Text("profile.websiteAndLinks".tr,
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            _customRow(text: coach.socialMediaLink!),
            // SizedBox(height: 8),
            // _customRow(text: "profile.website2".tr),
            // SizedBox(height: 8),
            // _customRow(text: "profile.website3".tr),
            SizedBox(height: 32),
            CustomButton(
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
              text: "profile.editButton".tr,
            ),
          ],
        );
      }),
    );
  }

  _customRow({required String text}) {
    return Row(
      children: [
        SvgPicture.asset('assets/icons/attach.svg'),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Color(0xFF4B5563),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}
