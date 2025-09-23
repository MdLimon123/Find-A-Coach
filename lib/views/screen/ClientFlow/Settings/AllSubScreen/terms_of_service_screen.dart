import 'package:find_me_a_coach/controllers/about_us_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TermsOfServiceScreen extends StatefulWidget {
  const TermsOfServiceScreen({super.key});

  @override
  State<TermsOfServiceScreen> createState() => _TermsOfServiceScreenState();
}

class _TermsOfServiceScreenState extends State<TermsOfServiceScreen> {
  final _aboutUsController = Get.put(AboutUsController());

  @override
  void initState() {
    _aboutUsController.fetchTermsAndCondition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "terms.title".tr),
      body: Obx(()=> _aboutUsController.isCondition.value?
      Center(child: CustomPageLoading()):
      ListView.builder(
        itemCount: _aboutUsController.termsAndConditionList.length,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        itemBuilder: (context, index) {
          final item = _aboutUsController.termsAndConditionList[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              Text(
                item.content,
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
