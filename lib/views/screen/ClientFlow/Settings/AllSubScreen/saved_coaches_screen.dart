import 'package:find_me_a_coach/controllers/clientController/client_profile_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SavedCoachesScreen extends StatefulWidget {
  const SavedCoachesScreen({super.key});

  @override
  State<SavedCoachesScreen> createState() => _SavedCoachesScreenState();
}

class _SavedCoachesScreenState extends State<SavedCoachesScreen> {

  final _profileController = Get.put(ClientProfileController());

  @override
  void initState() {
    _profileController.fetchSaveCoach();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Saved Coaches"),
      body: Obx(()=> _profileController.isSaveCoachLoading.value?
      Center(child: CustomPageLoading()):
      ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemBuilder: (context, index){
          final coach = _profileController.savedCoach[index];
          return Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomNetworkImage(
                      imageUrl: "${ApiConstant.imageBaseUrl}${coach.coachImage}",
                      height: 70,
                      boxShape: BoxShape.circle,
                      width: 70),


                  SizedBox(width: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(coach.coachName,
                            style: AppStyles.h3(
                                color: AppColors.bigTextColor
                            ),),
                          SizedBox(height: 4,),
                          Text(coach.coachingAreaName.first,
                            style: AppStyles.h5(
                                color: Color(0xFF6B7280)
                            ),),
                          SizedBox(height: 4,),
                          Text("From \$${coach.pricePerSession}",
                              style: AppStyles.h3(
                                  color: AppColors.bigTextColor
                              ))
                        ],
                      ),

                      SizedBox(width: 130,),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6ECF3),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset('assets/icons/message.svg'),
                        ),
                      )
                    ],
                  )
                ],
              )
          );
        },
        separatorBuilder: (_,index)=> SizedBox(height: 8,),
        itemCount: _profileController.savedCoach.length,)),
    );
  }
}
