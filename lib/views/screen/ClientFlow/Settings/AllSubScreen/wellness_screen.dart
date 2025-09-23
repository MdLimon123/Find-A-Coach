import 'package:find_me_a_coach/controllers/clientController/client_profile_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class WellnessScreen extends StatefulWidget {
  const WellnessScreen({super.key});

  @override
  State<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {


  final _clientProfileController = Get.put(ClientProfileController());


  @override
  void initState() {
      _clientProfileController.fetchAllMilestones();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "wellnessScreen.title".tr),
      body: Obx(()=> _clientProfileController.isMilestoneLoading.value?
      Center(child: CustomPageLoading()):
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withValues(alpha: 0.08),
                      blurRadius: 5.4,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/well.svg'),
                      SizedBox(width: 8),
                      Text(
                        "wellnessScreen.title".tr,
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(color: Color(0xFF9CA3AF), height: 1),
                  SizedBox(height: 20),

                  /// Milestones list
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _clientProfileController.clientMilestones.length,
                    itemBuilder: (context, index) {
                      final milestone = _clientProfileController.clientMilestones[index];
                      return Container(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: milestone.isCompleted
                              ? Color(0xFFE6ECF3)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                         Checkbox(
                                value: milestone.isCompleted,
                                onChanged: (bool? value) {
                                  if (value != null) {

                                    _clientProfileController.toggleMilestoneCompleted(index, value);
                                  }

                                },
                              ),


                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Milestone ${milestone.order}",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF6B7280),
                                    ),
                                  ),
                                  Text(
                                    milestone.description,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF374151),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

            Spacer(),

            /// Button
            Obx(
              ()=> CustomButton(
                loading: _clientProfileController.isUpdateLoading.value,
                onTap: () {
                  final List<Map<String, dynamic>> updatedMilestones =
                  _clientProfileController.clientMilestones
                      .map((m) => {
                    "id": m.id,
                    "is_completed": m.isCompleted,
                  })
                      .toList();
                  
                  print("Updated Milestones: $updatedMilestones");

                  _clientProfileController.updateMilestone(updatedMilestones);
                },
                text: 'wellnessScreen.confirm'.tr,
              ),
            )
          ],
        ),
      )),
    );
  }
}
