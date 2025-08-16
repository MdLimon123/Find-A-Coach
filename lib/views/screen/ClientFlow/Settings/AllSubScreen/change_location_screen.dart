import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class ChangeLocationScreen extends StatefulWidget {
  const ChangeLocationScreen({super.key});

  @override
  State<ChangeLocationScreen> createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  
  final _locationController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Change Location"),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Column(
              children: [
                Text("Location",
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),),
                SizedBox(height: 8,),
                CustomTextField(controller: _locationController,
                hintText: 'Enter your location',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(Icons.location_on_outlined, color: Color(0xFF00428A),),
                  ),
                )
              ],
            ),
            Spacer(),
            CustomButton(onTap: (){},
                text: "Confirm")
          ],
        ),
      ),
    );
  }
}
