import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:Colors.white,
        elevation: 0,
        title: Text(title,style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.bigTextColor
        ),),
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios,color: AppColors.bigTextColor,
            size: 18,),
        )
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}