
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';


class WelcomeScreen extends StatefulWidget {

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/images/splash1.png'),
          SizedBox(height: 80,),
          Text('One World. Thousands of Coaches',
          style: AppStyles.h1(color: AppColors.primaryColor,),
          textAlign: TextAlign.center,),
          SizedBox(height: 8,),
          Text('Just One Match Away',
            style: AppStyles.h1(color: AppColors.primaryColor,),
            textAlign: TextAlign.center,),
          SizedBox(height: 64,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 73),
            child: CustomButton(onTap: (){},
                text: "Next"),
          )

        ],
      ),
    );
  }
}
