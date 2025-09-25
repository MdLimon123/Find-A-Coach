import 'package:find_me_a_coach/controllers/clientController/ai_chat_controller.dart';
import 'package:find_me_a_coach/controllers/clientController/client_chat_controller.dart';
import 'package:find_me_a_coach/controllers/clientController/client_home_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:find_me_a_coach/views/base/upcoming_session_card.dart';
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
  final _clientHomeController = Get.put(ClientHomeController());

  final _clientAiChatController = Get.put(AIChatController());



  @override
  void initState() {
    _clientHomeController.fetchUpcomingSessions();
    _clientHomeController.fetchCoachCategories();
    _clientHomeController.fetchFeaturedCoach();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final imageBaseUrl = ApiConstant.imageBaseUrl;

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
                _clientAiChatController.createSession();
              },
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
        child: Obx(
          () => _clientHomeController.isLoading.value?
              Center(child: CustomPageLoading()): Column(
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



              Obx((){
                if(_clientHomeController.upcomingSessions.isEmpty){
                  return SizedBox();
                }
                final session = _clientHomeController.upcomingSessions.last;
                return UpcomingSessionCard(session: session);
              }),


              SizedBox(height: 20),
              Text(
                "coaching_categories".tr,
                style: AppStyles.h3(color: AppColors.bigTextColor),
              ),
              SizedBox(height: 10),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  itemCount: _clientHomeController.coachCategories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final category = _clientHomeController.coachCategories[index];
                    final imageUrl = category.coaches.isNotEmpty
                        ? "$imageBaseUrl${category.coaches.first.image}"
                        : "$imageBaseUrl/media/profile_images/default.jpg";
                    return SizedBox(
                      width: 80,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                              child: CustomNetworkImage(
                                  imageUrl: imageUrl,
                                  height: 50,
                                  boxShape: BoxShape.circle,
                                  width: 50),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            category.name,
                            maxLines: 1,
                            style: AppStyles.h4(color: Color(0xFF1F2937)),
                            overflow: TextOverflow.fade,
                          ),
                        ],
                      ),
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

              _featuredCoachItem()
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ClientBottomMenu(0),
    );
  }

  Widget _featuredCoachItem() {
    final totalItems = _clientHomeController.clientFeatureCoach.length;
    final displayCount = totalItems >= 2 ? 2 : totalItems;
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final coach = _clientHomeController.clientFeatureCoach[index];

        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.textColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [

              CustomNetworkImage(
                imageUrl: "${ApiConstant.imageBaseUrl}${coach.image}",
                height: 70,
                width: 70,
                boxShape: BoxShape.circle,
              ),

              SizedBox(width: 12),

              // Name, area, price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coach.fullName,
                      style: AppStyles.h3(color: AppColors.bigTextColor),
                    ),
                    SizedBox(height: 4),
                    Text(
                      coach.coachingAreaNames.isNotEmpty
                          ? coach.coachingAreaNames.first
                          : 'N/A',
                      style: AppStyles.h5(color: Color(0xFF6B7280)),
                    ),
                    SizedBox(height: 4),
                    Text(
                      coach.pricePerSession != null
                          ? "\$${coach.pricePerSession!.toStringAsFixed(2)}"
                          : 'N/A',
                      style: AppStyles.h3(color: AppColors.bigTextColor),
                    ),
                  ],
                ),
              ),


              InkWell(
                onTap: (){
                  _clientHomeController.createChat(
                      id: coach.userId,
                      name: coach.fullName,
                      image: coach.image);
                },
                child: Container(
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
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: displayCount,
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
