import 'package:find_me_a_coach/controllers/coachController/coach_home_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {

  final linkController = TextEditingController();
  
  final _coachHomeController = Get.put(CoachHomeController());
  
  
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      _coachHomeController.fetchCoachUpcomingSession();
    });
    super.initState();
  }
  

  @override
  Widget build(BuildContext context) {
    return Obx(()=> _coachHomeController.isLoading.value?
    Center(child: CustomPageLoading()):
    ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index){
          final session = _coachHomeController.coachUpcomingSessionList[index];
          final sessionDate = DateTime.parse(session.sessionDate); // "2025-09-30"
          final timeParts = session.sessionTime.split(':');        // "10:00:00"
          final sessionDateTime = DateTime(
            sessionDate.year,
            sessionDate.month,
            sessionDate.day,
            int.parse(timeParts[0]),
            int.parse(timeParts[1]),
            int.parse(timeParts[2]),
          );


          final bool canJoin = DateTime.now().isAfter(sessionDateTime);
          return InkWell(
            onTap: (){

            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      CustomNetworkImage(
                          imageUrl: "${ApiConstant.imageBaseUrl}${session.coachImage}",
                          boxShape: BoxShape.circle,
                          height: 50,
                          width: 50),

                      SizedBox(width: 4,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(session.coachName,
                            style: TextStyle(
                                color: Color(0xFF1F2937),
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                            ),),
                          SizedBox(height: 4,),
                          Text(session.coachingAreaName,
                            style: TextStyle(
                                color: AppColors.bigTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6ECF3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Row(
                          children: [
                            Icon(Icons.calendar_today,
                                color: Color(0xFF00428A), size: 18),
                            SizedBox(width: 6),
                            Text(

                               DateFormat('EEEE, MMM d').format(DateTime.parse(session.sessionDate)),
                              style: TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6),
                          child: SizedBox(
                            height: 24,
                            child: VerticalDivider(
                              color: Color(0xFF4B5563),
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),

                        // Time
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                color: Color(0xFF4B5563), size: 18),
                            SizedBox(width: 6),
                            Text(

                              DateFormat.jm().format(
                                DateTime(
                                  DateTime.now().year,
                                  DateTime.now().month,
                                  DateTime.now().day,
                                  int.parse(session.sessionTime.split(":")[0]),
                                  int.parse(session.sessionTime.split(":")[1]),
                                  int.parse(session.sessionTime.split(":")[2]),
                                ),
                              ),
                              style: TextStyle(
                                  color: Color(0xFF4B5563),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),

                        // Device Icon
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  color: Color(0xFF002F62),
                                  shape: BoxShape.circle),
                              child: Icon(Icons.computer,
                                  color: Colors.white, size: 18)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  if(canJoin)
                  InkWell(
                    onTap: (){

                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                            backgroundColor: AppColors.textColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Link",
                                  style: TextStyle(
                                      color: AppColors.bigTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500

                                  ),),
                                SizedBox(height: 8,),
                                CustomTextField(controller: linkController,
                                  hintText: 'Paste link',
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset('assets/icons/attach.svg'),
                                  ),)
                              ],
                            )
                        );
                      });

                    },
                    child: Container(
                        width: double.infinity,
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/icons/video.svg'),
                            SizedBox(width: 8,),
                            Text("Join  Session",
                              style:TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textColor),)
                          ],
                        )),
                  )


                ],
              ),
            ),
          );
        },
        separatorBuilder: (__, _)=> SizedBox(height: 12,),
        itemCount: _coachHomeController.coachUpcomingSessionList.length));

  }
}
