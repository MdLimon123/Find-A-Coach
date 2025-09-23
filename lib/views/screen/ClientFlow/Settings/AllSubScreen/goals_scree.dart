import 'package:find_me_a_coach/controllers/clientController/client_profile_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/AllSubScreen/wellness_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class GoalsScree extends StatefulWidget {
  const GoalsScree({super.key});

  @override
  State<GoalsScree> createState() => _GoalsScreeState();
}

class _GoalsScreeState extends State<GoalsScree> {
  final _clientProfileController = Get.put(ClientProfileController());

  @override
  void initState() {
    _clientProfileController.fetchAllGoal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Goals"),
      body: Obx(() {
        if (_clientProfileController.isGoalLoading.value) {
          return const Center(child: CustomPageLoading());
        }

        return ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  Get.to(() => const WellnessScreen());
                },
                child: Container(
                  width: screenWidth * 0.9,
                  padding: EdgeInsets.all(screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withValues(alpha: 0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/well.svg'),
                          SizedBox(width: screenWidth * 0.02),
                          Text(
                            "Wellness",
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenWidth * 0.05),

                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 8,
                          inactiveTrackColor: const Color(0xFFC7D3EB),
                          activeTrackColor: const Color(0xFF47B2FF),
                          thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 10,
                          ),
                          overlayShape: SliderComponentShape.noOverlay,
                          thumbColor: const Color(0xFFC7D3EB),
                        ),
                        child: AbsorbPointer(

                          child: Slider(
                            min: 0,
                            max: _clientProfileController.totalMilestones.value
                                .toDouble(),
                            value: _clientProfileController
                                .completedMilestones
                                .value
                                .clamp(
                                  0,
                                  _clientProfileController
                                      .totalMilestones
                                      .value,
                                )
                                .toDouble(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),

                      SizedBox(height: screenWidth * 0.03),

                      Text(
                        "Milestones Completed: "
                        "${_clientProfileController.completedMilestones}/${_clientProfileController.totalMilestones}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF374151),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),

      // body: ListView(
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      //   children: [
      //     Center(
      //       child: InkWell(
      //         onTap: (){
      //           Get.to(()=> WellnessScreen());
      //         },
      //         child: Container(
      //           width: screenWidth * 0.9,
      //           padding: EdgeInsets.all(screenWidth * 0.04),
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             borderRadius: BorderRadius.circular(12),
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.blue.withValues(alpha: 0.1),
      //                 blurRadius: 10,
      //                 offset: const Offset(0, 4),
      //               ),
      //             ],
      //           ),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               /// Title Row
      //               Row(
      //                 children: [
      //                  SvgPicture.asset('assets/icons/well.svg'),
      //                   SizedBox(width: screenWidth * 0.02),
      //                   Text(
      //                     "Wellness",
      //                     style: TextStyle(
      //                       fontSize: screenWidth * 0.045,
      //                       fontWeight: FontWeight.w600,
      //                       color: Colors.black87,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               SizedBox(height: screenWidth * 0.05),
      //
      //
      //
      //               /// Progress bar with styled circle marker
      //               SliderTheme(
      //                 data: SliderTheme.of(context).copyWith(
      //                   trackHeight: 8,
      //                   inactiveTrackColor: const Color(0xFFC7D3EB),
      //                   activeTrackColor: const Color(0xFF47B2FF),
      //                   thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
      //                   overlayShape: SliderComponentShape.noOverlay,
      //                   thumbColor: const Color(0xFFC7D3EB),
      //                 ),
      //                 child: Obx(() => Slider(
      //                   min: 0,
      //                   max: _clientProfileController.totalMilestones.value.toDouble(),
      //                   value: _clientProfileController.completedMilestones.value
      //                       .clamp(0, _clientProfileController.totalMilestones.value)
      //                       .toDouble(),
      //                   onChanged: null,
      //                 )),
      //               ),
      //
      //
      //               SizedBox(height: screenWidth * 0.03),
      //
      //               /// Milestone text
      //               Obx(
      //                   ()=> Text(
      //                   "Milestones Completed: ${_clientProfileController.completedMilestones.toString()}/${_clientProfileController.totalMilestones.toString()}",
      //                   style: TextStyle(
      //                     fontSize: 12,
      //                     fontWeight: FontWeight.w400,
      //                     color: Color(0xFF374151),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
