import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemBuilder: (context, index){
          return Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: AppColors.textColor,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Row (
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                                fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 8,),
                      Text("Leslie Alexander",
                        style: TextStyle(
                            color: Color(0xFF1F2937),
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),)
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFFE6ECF3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Date
                        Row(
                          children: const [
                            Icon(Icons.calendar_today, color: Color(0xFF00428A), size: 18),
                            SizedBox(width: 6),
                            Text(
                              "Monday, June 15",
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SizedBox(
                            height: 24, //
                            child: VerticalDivider(
                              color: Color(0xFF4B5563),
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),


                        // Time
                        Row(
                          children: const [
                            Icon(Icons.access_time,color: Color(0xFF4B5563), size: 18),
                            SizedBox(width: 6),
                            Text(
                              "10:00 AM",
                              style: TextStyle(
                                color: Color(0xFF4B5563),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
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
                                  shape: BoxShape.circle
                              ),
                              child: Icon(Icons.computer, color: Colors.white, size: 18)),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Color(0xFFE6ECF3),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Color(0xFFE6E7EA),width: 1),
                          ),
                          child: Center(
                            child: Text("Decline",
                              style: TextStyle(
                                  color: Color(0xFF031330),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                              ),),
                          ),
                        ),
                      ),
                      SizedBox(width: 12,),
                      Expanded(
                        child: CustomButton(onTap: (){},
                            text: 'Accept'),
                      )
                    ],
                  )
                ],
              )
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 12),
        itemCount: 5);
  }
}
