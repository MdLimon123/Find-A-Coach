import 'package:find_me_a_coach/controllers/clientController/client_home_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ClientFeaturedCoachScreen extends StatefulWidget {
  const ClientFeaturedCoachScreen({super.key});

  @override
  State<ClientFeaturedCoachScreen> createState() =>
      _ClientFeaturedCoachScreenState();
}

class _ClientFeaturedCoachScreenState
    extends State<ClientFeaturedCoachScreen> {
  final _clientHomeController = Get.put(ClientHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "featured_coaches".tr),
      body: ListView.separated(
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
                // Coach image
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
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 8),
        itemCount: _clientHomeController.clientFeatureCoach.length,
      ),
    );
  }


}
