import 'package:find_me_a_coach/controllers/clientController/client_chat_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachChat/coach_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachSetting/coach_setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../ClientFlow/Notification/notification_screen.dart';
import '../../ClientFlow/Settings/settings_screen.dart';

class CoachInboxScreen extends StatefulWidget {
  const CoachInboxScreen({super.key});

  @override
  State<CoachInboxScreen> createState() => _CoachInboxScreenState();
}

class _CoachInboxScreenState extends State<CoachInboxScreen> {

  final _clientChatController = Get.put(ClientChatController());


  String formatTime(String timestamp) {
    final dateTime = DateTime.parse(timestamp);
    final formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  @override
  void initState() {
    _clientChatController.fetchInboxMessage();
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
      body: Obx(()=> _clientChatController.isInboxLoading.value?
      Center(child: CustomPageLoading()):
      ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemCount: _clientChatController.clientInboxModel.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final inboxMessage = _clientChatController.clientInboxModel[index];
          return InkWell(
            onTap: () {
              _clientChatController.createChatWithCoach(
                id: inboxMessage.user.userId,
                name: inboxMessage.user.fullName,
                image: inboxMessage.user.image,
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// avatar
                  CustomNetworkImage(
                    imageUrl: "${ApiConstant.imageBaseUrl}${inboxMessage.user.image}",
                    boxShape: BoxShape.circle,
                    height: 40,
                    width: 40,
                  ),
                  const SizedBox(width: 12),

                  /// name + last message
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          inboxMessage.user.fullName,
                          style: const TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          inboxMessage.lastMessage?.content ?? 'No message yet',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// time + badge aligned right
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        inboxMessage.lastMessage?.timestamp != null
                            ? formatTime(
                          inboxMessage.lastMessage!.timestamp.toString(),
                        )
                            : '',
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6),

                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          inboxMessage.unseenCount.toString(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      )
      ),

      bottomNavigationBar: CoachBottomMenu(3),
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
