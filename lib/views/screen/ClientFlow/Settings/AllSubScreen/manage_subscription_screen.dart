import 'package:find_me_a_coach/utils/app_colors.dart' show AppColors;
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageSubscriptionScreen extends StatefulWidget {
  const ManageSubscriptionScreen({super.key});

  @override
  State<ManageSubscriptionScreen> createState() => _SubscriptionPlanScreenState();
}

class _SubscriptionPlanScreenState extends State<ManageSubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppbar(title: "Manage Subscription"),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          children: [
            SizedBox(height: 24.h,),
            Container(
              padding: EdgeInsets.only(top: 24.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("Monthly",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937)
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("\$XX",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        ),),
                    ),
                    SizedBox(height: 16.h,),
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(height: 28.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("Features",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F2937)
                        ),),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Personalized recommendations",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Access to the AI Coach",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Access to discussion boards",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 28.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 11.w),
                      child: CustomButton(onTap: (){},
                          text: "Choose"),
                    ),
                    SizedBox(height: 20.h,)
                  ]
              ),
            ),
            SizedBox(height: 16.h,),
            Container(
              padding: EdgeInsets.only(top: 24.h),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("Yearly",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937)
                        ),),
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("\$XX",
                        style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor
                        ),),
                    ),
                    SizedBox(height: 16.h,),
                    Container(
                      width: double.infinity,
                      height: 1.h,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(height: 28.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text("Features",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF1F2937)
                        ),),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Personalized recommendations",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Access to the AI Coach",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Access to discussion boards",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Access to exclusive content",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            width: 20.w,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle
                            ),
                            child:  Center(
                              child: Icon(Icons.check,
                                color: AppColors.textColor,
                                size: 12.sp,),
                            ),
                          ),
                          SizedBox(width: 8.w,),
                          Text("Early access to coaching events",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF4B5563)
                            ),)
                        ],
                      ),
                    ),


                    SizedBox(height: 28.h,),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 11.w),
                      child: InkWell(
                        onTap: (){},
                        child: Container(
                            height: 50.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(12.sp)
                            ),
                            child: Center(
                              child: Text("Choose",
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textColor
                                ),),
                            )

                        ),
                      ),
                    ),
                    SizedBox(height: 20.h,)
                  ]
              ),
            ),
          ],
        )
    );
  }
}