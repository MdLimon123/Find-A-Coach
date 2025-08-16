import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Settings"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          _buildCustomContainer(
              onTap: (){},
            image: 'assets/icons/profile.svg',
            text: 'Profile'
          ),
          SizedBox(height: 12,),
          _buildCustomContainer(
              onTap: (){},
              image: 'assets/icons/goal.svg',
              text: 'Goals'
          ),
          SizedBox(height: 12,),
          _buildCustomContainer(
              onTap: (){},
              image: 'assets/icons/save.svg',
              text: 'Saved Coaches'
          ),
          SizedBox(height: 12,),
          _buildCustomContainer(
              onTap: (){},
              image: 'assets/icons/global.svg',
              text: 'Change Language'
          ),
          SizedBox(height: 12,),
          _buildCustomContainer(
              onTap: (){},
              image: 'assets/icons/location.svg',
              text: 'Change Location'
          ),
          SizedBox(height: 12,),
          _buildCustomContainer(
              onTap: (){},
              image: 'assets/icons/safety.svg',
              text: 'Safety & Ethics'
          ),
          SizedBox(height: 12,),
          _buildCustomContainer(
            onTap: (){},
              image: 'assets/icons/manage.svg',
              text: 'Manage Subscription'
          ),
          SizedBox(height: 12,),
          InkWell(
            onTap: (){
              _showLogoutBottomSheet(context);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
              height: 60,
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF000000).withValues(alpha: 0.08),
                      blurRadius: 5.4,
                      offset: Offset(0, 2),
                    )
                  ]
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/logout.svg'),
                  SizedBox(width: 8,),
                  Text("Logout",
                    style: TextStyle(
                      color: Color(0xFFE25252),
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

   _buildCustomContainer({required String image, required String text, required Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withValues(alpha: 0.08),
                  blurRadius: 5.4,
                  offset: Offset(0, 2),
                )
              ]
            ),
            child: Row(
              children: [
                SvgPicture.asset(image),
                SizedBox(width: 8,),
                Text(text,
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),)
              ],
            ),
          ),
    );
  }

  _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 35),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Logout",
                  style: TextStyle(
                    color: Color(0xFFE25252),
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 24),
                Container(
                    width: double.maxFinite,
                    height: 0.5,
                    color: Color(0xFFE5E7EB)
                ),
                SizedBox(height: 24),
                Text(
                  "Are you sure you want to log out?",
                  textAlign: TextAlign.center,
                  style:
                  TextStyle(fontWeight: FontWeight.w600, fontSize: 18,
                      color: Color(0xFF757575)),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () async{

                        },
                        child: Container(
                          height: 50,
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFF5981C1),
                                  width: 1)),
                          child: Text(
                            "Yes",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 6, vertical: 10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: AppColors.primaryColor),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }

}
