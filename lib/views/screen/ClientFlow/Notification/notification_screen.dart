import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Notification"),

      body: ListView.separated(
        physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          itemBuilder: (context, index){
            return SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.textColor,
                      shape: BoxShape.circle
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/icons/notification2.svg'),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Session Confirmed with Coach Maria Hernandez has been successfully confirmed for 19 July at 10 Am",
                        style: TextStyle(
                          color: Color(0xFF4B5563),
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),),
                        SizedBox(height: 4,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/icons/clock.svg'),
                            SizedBox(width: 4,),
                            Text("1 hour ago",
                            style: TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 12,
                              fontWeight: FontWeight.w400
                            ),)
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
          separatorBuilder: (_, index)=> SizedBox(height: 10,),
          itemCount: 10),

    );
  }
}
