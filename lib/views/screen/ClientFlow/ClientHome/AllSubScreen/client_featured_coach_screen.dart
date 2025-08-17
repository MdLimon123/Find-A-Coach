import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "featured_coaches".tr),
      body: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _coachItem(
            nameKey: "eleanor_pena".tr,
            titleKey: "mindset_coach".tr,
            priceKey: "from_50".tr,
          );
        },
        separatorBuilder: (_, index) => SizedBox(height: 8),
      ),
    );
  }

  Widget _coachItem(
      {required String nameKey,
        required String titleKey,
        required String priceKey}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: AppColors.textColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                  image: AssetImage('assets/images/person.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              )
            ],
          )
        ],
      ),
    );
  }
}
