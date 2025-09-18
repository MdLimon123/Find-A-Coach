import 'package:find_me_a_coach/controllers/clientController/client_community_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientCommunity/AllSubScreen/create_discussion_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientCommunityScreen extends StatefulWidget {
  const ClientCommunityScreen({super.key});

  @override
  State<ClientCommunityScreen> createState() => _ClientCommunityScreenState();
}

class _ClientCommunityScreenState extends State<ClientCommunityScreen> {


  final _clientCommunityController = Get.put(ClientCommunityController());

  @override
  void initState() {
    _clientCommunityController.fetchCommunityData();
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
                    Get.to(() => AiChatScreen());
                  },
                  image: 'assets/icons/cross.svg'),
              _customContainer(
                  onTap: () {
                    Get.to(() => NotificationScreen());
                  },
                  image: 'assets/icons/notification.svg'),
              _customContainer(
                  onTap: () {
                    Get.to(() => SettingsScreen());
                  },
                  image: 'assets/icons/settings.svg'),
            ],
          )),
      body: Obx(()=> _clientCommunityController.isLoading.value?
      Center(child: CustomPageLoading()):
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _customCategories(textKey: "mindset".tr),
                  SizedBox(width: 8),
                  _customCategories(textKey: "confidence".tr),
                  SizedBox(width: 8),
                  _customCategories(textKey: "self_esteem".tr),
                  SizedBox(width: 8),
                  _customCategories(textKey: "motivational".tr),
                  SizedBox(width: 8),
                  _customCategories(textKey: "goal_setting".tr),
                ],
              ),
            ),
            SizedBox(height: 24),
            Expanded(
                child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final community = _clientCommunityController.communityList[index];
                      return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20)),
                            ),
                            builder: (context) {
                              return CommentBottomSheet();
                            },
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: AppColors.textColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                  Color(0xFF000000).withValues(alpha: 0.05),
                                  blurRadius: 10,
                                  offset: Offset(0, 3),
                                ),
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [

                                  CustomNetworkImage(
                                      imageUrl: "${ApiConstant.imageBaseUrl}${community.image}",
                                      boxShape: BoxShape.circle,
                                      height: 32,
                                      width: 32),
                                  SizedBox(width: 8),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        community.userName,
                                        style: TextStyle(
                                          color: Color(0xFF2D2D2D),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "time_10_min".tr,
                                        style: TextStyle(
                                            color: Color(0xFFAFAFAF),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w400),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: 10),
                              Divider(
                                color: Color(0xFFE6ECF3),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Topic: ${community.topicName}",
                                style: TextStyle(
                                  color: Color(0xFF9CA3AF),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                community.content,
                                style: TextStyle(
                                  color: Color(0xFF222222),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/secondaryComment.svg'),
                                  SizedBox(width: 4),
                                  Text(
                                    "comment_count_20".tr,
                                    style: TextStyle(
                                      color: Color(0xFF4B4B4B),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(height: 12),
                    itemCount: _clientCommunityController.communityList.length))
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Get.to(() => CreateDiscussionScreen());
        },
        child: SvgPicture.asset('assets/icons/add.svg'),
      ),
      bottomNavigationBar: ClientBottomMenu(2),
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
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(image),
        ),
      ),
    );
  }

  _customCategories({required String textKey}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 8),
      height: 34,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3368A1)),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        textKey,
        style: TextStyle(
          color: Color(0xFF3368A1),
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key});

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.8,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "comments".tr,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1F2937),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundImage: AssetImage('assets/images/person.jpg'),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "henry_arthur".tr,
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1F2937),
                                    fontSize: 14),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "comment_sample".tr,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF4B5563)),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(height: 12),
                  itemCount: 10,
                ),
              ),
              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(color: AppColors.textColor),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          controller: commentController,
                          hintText: 'write_a_comment'.tr,
                        ),
                      ),
                      SizedBox(width: 8),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE6ECF3),
                            border: Border.all(color: Color(0xFFB0C4DB), width: 2)),
                        child: Center(
                          child: SvgPicture.asset('assets/icons/send.svg'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
