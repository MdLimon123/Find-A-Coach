import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/utils/style.dart';
import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ClientHomeScreen extends StatefulWidget {
  const ClientHomeScreen({super.key});

  @override
  State<ClientHomeScreen> createState() => _ClientHomeScreenState();
}

class _ClientHomeScreenState extends State<ClientHomeScreen> {
  
  final searchController = TextEditingController();

  final List<Map<String, String>> items = [
    {
      "image": "assets/images/container.png",
      "title": "Business",

    },
    {
      "image": "assets/images/career.png",
      "title": "Career",

    },
    {
      "image": "assets/images/familly.png",
      "title": "Family",

    },
    {
      "image": "assets/images/financial.png",
      "title": "Financial",

    },
    {
      "image": "assets/images/well.png",
      "title": "Wellness",

    },
    {
      "image": "assets/images/sun.png",
      "title": "Wellness",

    },
    {
      "image": "assets/images/brain.png",
      "title": "Wellness",

    },
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.textColor,
        automaticallyImplyLeading: false,
        title: Row(
          spacing: 12,
          children: [
            Image.asset('assets/images/app_logo1.png'),
            Spacer(),
            _customContainer(
              image: 'assets/icons/cross.svg'
            ),
            _customContainer(
                image: 'assets/icons/notification.svg'
            ),
            _customContainer(
                image: 'assets/icons/settings.svg'
            ),
          ],
        )
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(controller: searchController,
            hintText: "Search...",
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('assets/icons/search.svg'),
            ),),
            SizedBox(height: 20,),
            Text("Upcoming sessions",
            style: AppStyles.h3(
              color: AppColors.bigTextColor
            ),),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(12),

              ),
              child: Column(
                children: [
                  Row(
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Maria Hernandez",
                          style: AppStyles.h3(
                            color: AppColors.textColor
                          ),),
                          Text("Career Coach",
                            style: AppStyles.h5(
                                color: AppColors.textColor,
                              fontWeight: FontWeight.w400
                            ),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: Color(0xFF002F62),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:  Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Date
                        Row(
                          children: const [
                            Icon(Icons.calendar_today, color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "Monday, June 15",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Divider
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SizedBox(
                            height: 24, // Give height so the divider is visible
                            child: VerticalDivider(
                              color: Colors.white, // Light color so it’s visible on dark background
                              thickness: 1,
                              width: 1,
                            ),
                          ),
                        ),


                        // Time
                        Row(
                          children: const [
                            Icon(Icons.access_time, color: Colors.white, size: 18),
                            SizedBox(width: 6),
                            Text(
                              "10:00 AM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        // Device Icon
                        const Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Icon(Icons.computer, color: Colors.white, size: 18),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            Text("Coaching categories",
            style: AppStyles.h3(
              color: AppColors.bigTextColor
            ),),
            SizedBox(height: 10,),
            SizedBox(
              height: 90,
              child: ListView.separated(
                itemCount: items.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {

                  return SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {

                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFE6ECF3),

                            ),
                            child: Image.asset(items[index]['image']!),
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          items[index]['title']!,
                          style: AppStyles.h4(
                            color: Color(0xFF1F2937)
                          )
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 14,
                  );
                },
              ),
            ),
            SizedBox(height: 20,),
            
            Row(
              children: [
                Text("Featured Coaches",
                style: AppStyles.h3(
                  color: AppColors.bigTextColor
                ),),
                Spacer(),
                SvgPicture.asset('assets/icons/arrow_right.svg')
              ],
            ),
            SizedBox(height: 10,),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.textColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Container(
                   height: 70,
                   width: 70,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                     image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                         fit: BoxFit.cover)
                   ),
                 ),
                 SizedBox(width: 12,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Text("Eleanor Pena",
                         style: AppStyles.h3(
                           color: AppColors.bigTextColor
                         ),),
                         SizedBox(height: 4,),
                         Text("Mindset Coach",
                         style: AppStyles.h5(
                           color: Color(0xFF6B7280)
                         ),),
                         SizedBox(height: 4,),
                         Text("From \$50",
                             style: AppStyles.h3(
                                 color: AppColors.bigTextColor
                             ))
                       ],
                     ),

                     SizedBox(width: 60,),
                     Container(
                       height: 40,
                       width: 40,
                       decoration: BoxDecoration(
                         color: Color(0xFFE6ECF3),
                         shape: BoxShape.circle,
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: SvgPicture.asset('assets/icons/message.svg'),
                       ),
                     )
                   ],
                 )
               ],
              )
            ),
            SizedBox(height: 8,),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(image: AssetImage('assets/images/person.jpg'),
                              fit: BoxFit.cover)
                      ),
                    ),
                    SizedBox(width: 12,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Eleanor Pena",
                              style: AppStyles.h3(
                                  color: AppColors.bigTextColor
                              ),),
                            SizedBox(height: 4,),
                            Text("Mindset Coach",
                              style: AppStyles.h5(
                                  color: Color(0xFF6B7280)
                              ),),
                            SizedBox(height: 4,),
                            Text("From \$50",
                                style: AppStyles.h3(
                                    color: AppColors.bigTextColor
                                ))
                          ],
                        ),

                        SizedBox(width: 60,),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Color(0xFFE6ECF3),
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset('assets/icons/message.svg'),
                          ),
                        )
                      ],
                    )
                  ],
                )
            ),


          ],
        ),
      ),
      bottomNavigationBar: const ClientBottomMenu(0),
    );
  }

   _customContainer({required String image}) {
    return Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xFF5480B1), width: 0.8),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF1D4760).withValues(alpha: 0.018),
                  blurRadius: 2.2,
                  offset: Offset(0, 3),
                ),

              ]
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(image),
            ),
          );
  }


}
