import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/splash2.png'),
          SizedBox(height: 78,),
          Text("Coaching in Your Language. Support on Your Terms.",
          style: AppStyles.h1(color: AppColors.primaryColor,fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,),
          SizedBox(height: 76,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFE6ECF3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Color(0xFFB0C4DB),
                width: 2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/search.svg'),
                  Text("Find a Coach",
                  style: AppStyles.h3(
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor
                  ),)
                ],
              ),
            ),
          ),
          SizedBox(height: 16,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFE6ECF3),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFFB0C4DB),
                      width: 2)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/user.svg'),
                  Text("Register as a Coach",
                    style: AppStyles.h3(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryColor
                    ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
