import 'package:find_me_a_coach/controllers/about_us_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  final _aboutUsController = Get.put(AboutUsController());

  @override
  void initState() {
    _aboutUsController.fetchAboutUs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "aboutUs.title".tr),
      body: Obx(()=> _aboutUsController.isLoading.value?
      Center(child: CustomPageLoading()):
      ListView.builder(
          itemCount: _aboutUsController.aboutUsList.length,
          itemBuilder: (context, index) {
            final aboutUs = _aboutUsController.aboutUsList[index];
            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(aboutUs.title,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(aboutUs.content,
                      style: TextStyle(
                        color: Color(0xFF4B5563),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ));
          }))


    );
  }
}
