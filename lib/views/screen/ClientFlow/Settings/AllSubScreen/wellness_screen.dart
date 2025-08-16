import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WellnessScreen extends StatefulWidget {
  const WellnessScreen({super.key});

  @override
  State<WellnessScreen> createState() => _WellnessScreenState();
}

class _WellnessScreenState extends State<WellnessScreen> {

  final List<bool> _milestonesStatus = [true, true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Wellness"),
        body: Padding(
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
                    ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/well.svg'),
                        SizedBox(width: 8),
                        Text(
                          "Wellness",
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
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            color: _milestonesStatus[index]
                                ? Color(0xFFE6ECF3)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Checkbox(
                                value: _milestonesStatus[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _milestonesStatus[index] = value!;
                                  });
                                },
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Milestone ${index + 1}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF6B7280),
                                      ),
                                    ),
                                    Text(
                                      index == 0
                                          ? 'Complete 5 meditation sessions'
                                          : index == 1
                                          ? 'Exercise for 30 minutes, 3 times a week'
                                          : 'Track daily food intake for 30 days',
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
              CustomButton(
                onTap: () {},
                text: 'Confirm',
              )
            ],
          ),
        )

    );
  }
}
