import 'package:find_me_a_coach/controllers/clientController/client_booking_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientBooking/AllTabsScreen/widgets/tabs_widget_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientBookingScreen extends StatefulWidget {
  const ClientBookingScreen({super.key});

  @override
  State<ClientBookingScreen> createState() => _ClientBookingScreenState();
}

class _ClientBookingScreenState extends State<ClientBookingScreen> {

  final _clientBookingController = Get.put(ClientBookingController());

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
                  Get.to(()=> AiChatScreen());
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
                onTap: (){},
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
                itemCount: _clientBookingController.tabList.length,
                itemBuilder: (context, index) {
                  return Obx(() {


                    return TabsWidgetScreen(
                      onTap: () {
                        _clientBookingController.tabIndex.value = index;
                      },
                      isSelected: _clientBookingController.isTabSelected(index),
                      tabName: _clientBookingController.tabList[index],

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
              return _clientBookingController
                  .tabSections[_clientBookingController.tabIndex.value];
            }),
          ),
        ],
      ),
      bottomNavigationBar: ClientBottomMenu(4),
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
