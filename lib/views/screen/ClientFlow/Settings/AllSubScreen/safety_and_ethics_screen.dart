import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/AllSubScreen/aobut_us_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/AllSubScreen/privacy_policy_screen.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/AllSubScreen/terms_of_service_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SafetyAndEthicsScreen extends StatefulWidget {
  const SafetyAndEthicsScreen({super.key});

  @override
  State<SafetyAndEthicsScreen> createState() => _SafetyAndEthicsScreenState();
}

class _SafetyAndEthicsScreenState extends State<SafetyAndEthicsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "safety.title".tr),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          _customContainer(
            image: 'assets/icons/terms.svg',
            text: 'safety.terms'.tr,
            onTap: () {
              Get.to(() => TermsOfServiceScreen());
            },
          ),
          SizedBox(height: 12),
          _customContainer(
            image: 'assets/icons/privace.svg',
            text: 'safety.privacy'.tr,
            onTap: () {
              Get.to(() => PrivacyPolicyScreen());
            },
          ),
          SizedBox(height: 12),
          _customContainer(
            image: 'assets/icons/about.svg',
            text: 'safety.aboutUs'.tr,
            onTap: () {
              Get.to(() => AboutUsScreen());
            },
          ),
        ],
      ),
    );
  }

  _customContainer({
    required String image,
    required String text,
    required Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        height: 60,
        decoration: BoxDecoration(
          color: AppColors.textColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.08),
              blurRadius: 5.4,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Row(
          children: [
            SvgPicture.asset(image),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
