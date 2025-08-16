import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
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

  double progress = 2.6; // 2 milestones completed
  final double total = 3;


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Goals"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Center(
            child: InkWell(
              onTap: (){
                Get.to(()=> WellnessScreen());
              },
              child: Container(
                width: screenWidth * 0.9, // responsive width
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
                    /// Title Row
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



                    /// Progress bar with styled circle marker
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 8,
                        inactiveTrackColor: Color(0xFFC7D3EB),
                        activeTrackColor: Color(0xFF47B2FF),
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 10, // circle size
                        ),
                        overlayShape: SliderComponentShape.noOverlay, // no shadow
                        thumbColor: Color(0xFFC7D3EB),
                      ),
                      child: Slider(
                        min: 0,
                        max: total,
                        value: progress,
                        onChanged: (_) {}, // not interactive
                      ),
                    ),

                    SizedBox(height: screenWidth * 0.03),

                    /// Milestone text
                    Text(
                      "Milestones Completed: 2/3",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF374151),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
