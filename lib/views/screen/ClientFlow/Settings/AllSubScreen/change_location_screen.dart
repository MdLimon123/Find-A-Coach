import 'package:find_me_a_coach/controllers/coachController/coach_profile_controller.dart';
import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangeLocationScreen extends StatefulWidget {
  const ChangeLocationScreen({super.key});

  @override
  State<ChangeLocationScreen> createState() => _ChangeLocationScreenState();
}

class _ChangeLocationScreenState extends State<ChangeLocationScreen> {
  
  final locationController = TextEditingController();

  final _dataController = Get.put(DataController());
  final _coachProfileController = Get.put(CoachProfileController());

  updateData(){
    locationController.text = _dataController.coachLocation.value;

  }

  @override
  void initState() {
    _dataController.getCoachData().then((_){
      updateData();
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Change Location"),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Location",
            style: TextStyle(
              color: Color(0xFF4B5563),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 8,),
            CustomTextField(controller: locationController,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Icon(Icons.location_on_outlined, color: Color(0xFF00428A),),
              ),
            ),
            Spacer(),
            Obx(
                ()=> CustomButton(
                loading: _coachProfileController.changeLocationLoading.value,
                  onTap: (){
                _coachProfileController.changeLocation(location: locationController.text.trim());
              },
                  text: "Confirm"),
            )
          ],
        ),
      ),
    );
  }
}
