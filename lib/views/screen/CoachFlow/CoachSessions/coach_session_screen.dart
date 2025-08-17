import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/settings_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../controllers/coachController/coach_session_controller.dart';
import 'AllTabsScreen/widgets/coach_tabs_widget_screen.dart';

class CoachSessionScreen extends StatefulWidget {
  const CoachSessionScreen({super.key});

  @override
  State<CoachSessionScreen> createState() => _CoachSessionScreenState();
}

class _CoachSessionScreenState extends State<CoachSessionScreen> {

  final _coachSessionController = Get.put(CoachSessionController());

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
                  onTap: (){
                    Get.to(()=> CoachAiChatScreen());
                  },
                  image: 'assets/icons/cross.svg'
              ),
              _customContainer(
                  onTap: (){
                    Get.to(()=> NotificationScreen());
                  },
                  image: 'assets/icons/notification.svg'
              ),
              _customContainer(
                  onTap: (){
                    Get.to(()=> SettingsScreen());
                  },
                  image: 'assets/icons/settings.svg'
              ),
            ],
          )
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: _coachSessionController.tabList.length,
                itemBuilder: (context, index) {
                  return Obx(() {


                    return CoachTabsWidgetScreen(
                      onTap: () {
                        _coachSessionController.tabIndex.value = index;
                      },
                      isSelected: _coachSessionController.isTabSelected(index),
                      tabName: _coachSessionController.tabList[index],

                    );
                  });
                },
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
            child: Obx(() {
              return _coachSessionController
                  .tabSections[_coachSessionController.tabIndex.value];
            }),
          ),
        ],
      ),

      bottomNavigationBar: CoachBottomMenu(1),
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
                color: Color(0xFF1D4760).withValues(alpha: 0.018),
                blurRadius: 2.2,
                offset: Offset(0, 3),
              ),

            ]
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }
}
