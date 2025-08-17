import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/ai_chat_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/ClientHome/AllSubScreen/client_featured_coach_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Notification/notification_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  final searchController = TextEditingController();

  final List<Map<String, String>> items = [
    {"image": "assets/images/container.png", "title": "business".tr},
    {"image": "assets/images/career.png", "title": "career".tr},
    {"image": "assets/images/familly.png", "title": "family".tr},
    {"image": "assets/images/financial.png", "title": "financial".tr},
    {"image": "assets/images/well.png", "title": "wellness".tr},
    {"image": "assets/images/sun.png", "title": "wellness".tr},
    {"image": "assets/images/brain.png", "title": "wellness".tr},
  ];

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
              onTap: () => Get.to(() => AiChatScreen()),
              image: 'assets/icons/cross.svg',
            ),
            _customContainer(
              onTap: () => Get.to(() => NotificationScreen()),
              image: 'assets/icons/notification.svg',
            ),
            _customContainer(
              onTap: () => Get.to(() => SettingsScreen()),
              image: 'assets/icons/settings.svg',
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              controller: searchController,
              hintText: "${"search".tr}...",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "upcoming_sessions".tr,
              style: AppStyles.h3(color: AppColors.bigTextColor),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage('assets/images/person.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "maria_hernandez".tr,
                            style: AppStyles.h3(color: AppColors.textColor),
                          ),
                          Text(
                            "career_coach".tr,
                            style: AppStyles.h5(
                                color: AppColors.textColor,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF002F62),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "monday_june_15".tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Colors.white,
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "10_00_am".tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child:
                          Icon(Icons.computer, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "coaching_categories".tr,
              style: AppStyles.h3(color: AppColors.bigTextColor),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE6ECF3),
                          ),
                          child: Image.asset(items[index]['image']!),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        items[index]['title']!,
                        style: AppStyles.h4(color: Color(0xFF1F2937)),
                      ),
                    ],
                  );
                },
                separatorBuilder: (_, __) => SizedBox(width: 14),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "featured_coaches".tr,
                  style: AppStyles.h3(color: AppColors.bigTextColor),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Get.to(() => ClientFeaturedCoachScreen());
                  },
                  child: SvgPicture.asset('assets/icons/arrow_right.svg'),
                ),
              ],
            ),
            SizedBox(height: 10),
            _featuredCoachItem(
              nameKey: "eleanor_pena".tr,
              titleKey: "mindset_coach".tr,
              priceKey: "from_50".tr,
            ),
            SizedBox(height: 8),
            _featuredCoachItem(
              nameKey: "eleanor_pena".tr,
              titleKey: "mindset_coach".tr,
              priceKey: "from_50".tr,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const ClientBottomMenu(0),
    );
  }

  Widget _featuredCoachItem(
      {required String nameKey,
        required String titleKey,
        required String priceKey}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.textColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: AssetImage('assets/images/person.jpg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 12),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(nameKey, style: AppStyles.h3(color: AppColors.bigTextColor)),
                  SizedBox(height: 4),
                  Text(titleKey, style: AppStyles.h5(color: Color(0xFF6B7280))),
                  SizedBox(height: 4),
                  Text(priceKey, style: AppStyles.h3(color: AppColors.bigTextColor)),
                ],
              ),
              SizedBox(width: 60),
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
              ),
            ],
          )
        ],
      ),
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
}
