import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/Settings/AllSubScreen/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "Profile"),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage("assets/images/person.jpg"),
                  fit: BoxFit.cover)
                ),
              ),
              SizedBox(width: 12,),
              Text("Kathryn Murphy",
              style: TextStyle(
                color: Color(0xFF1F2937),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),)
            ],
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/location.svg'),
              SizedBox(width: 8,),
              Text("From: ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4B5563)
              ),),
              SizedBox(width: 8,),
              Text("New York, USA",
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),)
            ],
          ),
          SizedBox(height: 8,),
          Row(
            children: [
              SvgPicture.asset('assets/icons/global.svg'),
              SizedBox(width: 8,),
              Text("Languages:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5563)
                ),),
              SizedBox(width: 8,),
              Text("English, Spanish",
                style: TextStyle(
                  color: Color(0xFF4B5563),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),)
            ],
          ),
          SizedBox(height: 20,),
          Text("Bio",
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
          SizedBox(height: 20,),
          Text("Lorem ipsum dolor sit amet consectetur. Neque nunc sit egestas sed sed varius mi at. Nunc sagittis a sapien nunc faucibus. Elementum sed arcu praesent nec phasellus quam risus pretium. Quisque amet in turpis ridiculus nisl elementum at non suspendisse.",
          style: TextStyle(
            color: Color(0xFF4B5563),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),),
          SizedBox(height: 20,),
         Row(
           children: [
             Text("Ethnicity:",
             style: TextStyle(
               fontSize: 16,
               fontWeight: FontWeight.w400,
               color: Color(0xFF4B5563)
             ),),
             SizedBox(width: 4,),
             Text("Hispanic",
               style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w500,
                   color: Color(0xFF4B5563)
               ),)
           ],
         ),
          SizedBox(height: 8,),
          Row(
            children: [
              Text("Sexual Orientation:",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5563)
                ),),
              SizedBox(width: 4,),
              Text("Straight",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF4B5563)
                ),)
            ],
          ),
          SizedBox(height: 20,),
          Text("Website and Social Links",
          style: TextStyle(
            color: Color(0xFF1F2937),
            fontSize: 20,
            fontWeight: FontWeight.w500,

          ),),
          SizedBox(height: 8,),
          _customRow(
            text: 'www.website.com'
          ),
          SizedBox(height: 8,),
          _customRow(
              text: 'www.linkedin.com/in/maria.hernandez'
          ),
          SizedBox(height: 8,),
          _customRow(
              text: 'instagram.com/maria.hernandez'
          ),
          SizedBox(height: 32,),
          CustomButton(onTap: (){
            Get.to(()=> EditProfileScreen());
          },
              text: "Edit")

          
        ],
      ),
    );
  }

   _customRow({required String text}) {
    return Row(children: [

          SvgPicture.asset('assets/icons/attach.svg'),
          SizedBox(width: 8,),
          Expanded(
            child: Text(text,
            style: TextStyle(
              color: Color(0xFF4B5563),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),),
          )
        ],);
  }
}
