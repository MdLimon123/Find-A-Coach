import 'package:find_me_a_coach/controllers/clientController/client_chat_controller.dart';
import 'package:find_me_a_coach/controllers/clientController/client_home_controller.dart';
import 'package:find_me_a_coach/controllers/clientController/client_search_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() =>
      _SearchScreenState();
}

class _SearchScreenState
    extends State<SearchScreen> {


  final _searchController = Get.put(ClientSearchController());
  final _clientHomeController = Get.put(ClientHomeController());
  final searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Search"),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: CustomTextField(
              controller: searchController,
              onChanged: (value) {
                _searchController.onSearchChanged(value);
              },
              hintText: "${"search".tr}...",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icons/search.svg'),
              ),
            ),
          ),

          Obx(() {
            if (_searchController.isSearchLoading.value) {
              return const Center(child: CustomPageLoading());
            }



            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _searchController.searchCoachList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final coach = _searchController.searchCoachList[index];
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
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
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(coach.fullName,
                                style: AppStyles.h3(color: AppColors.bigTextColor)),
                            const SizedBox(height: 4),
                            Text(
                              coach.coachingAreaNames.isNotEmpty
                                  ? coach.coachingAreaNames.first
                                  : 'N/A',
                              style: AppStyles.h5(color: const Color(0xFF6B7280)),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              coach.pricePerSession != null
                                  ? "\$${coach.pricePerSession.toStringAsFixed(2)}"
                                  : 'N/A',
                              style: AppStyles.h3(color: AppColors.bigTextColor),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _clientHomeController.createChat(
                            id: coach.userId,
                            name: coach.fullName,
                            image: coach.image,
                          );
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
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
            );
          }),
        ],

      ),
    );
  }


}
