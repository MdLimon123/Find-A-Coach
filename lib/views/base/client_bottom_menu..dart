
import 'package:find_me_a_coach/helpers/route.dart';
import 'package:find_me_a_coach/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../utils/app_colors.dart';

class ClientBottomMenu extends StatelessWidget {
  final int menuIndex;

  const ClientBottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.primaryColor : theme.disabledColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: Padding(
          padding: const EdgeInsets.only(top:8),
          child: SvgPicture.asset(
            image,
            height: 24.0,
            width: 24.0,
            color: colorByIndex(theme, index),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem(AppIcons.homeIcon, 'Home', theme, 0),
      getItem(AppIcons.searchIcon, 'Find Coach', theme, 1),
      getItem(AppIcons.communityIcon, 'Community', theme, 2),
      getItem(AppIcons.commentIcon, 'Messages', theme, 3),
      getItem(AppIcons.boxIcon, 'Bookings', theme, 4),
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.borderColor, width: 1)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: menuIndex,
        selectedItemColor: Theme.of(context).primaryColor,


        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedLabelStyle: const TextStyle(fontSize: 12,
        fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontSize: 12,
            fontWeight: FontWeight.w600),

        onTap: (value) {
          switch (value) {
            case 0:
              Get.offAndToNamed(AppRoutes.clientHomeScreen);
              break;
            case 1:
              Get.offAndToNamed(AppRoutes.findCoach);
              break;
            case 2:
              Get.offAndToNamed(AppRoutes.clientCommunityScreen);
              break;
            case 3:
              Get.offAndToNamed(AppRoutes.clientInboxScreen);
              break;
            case 4:
              Get.offAndToNamed(AppRoutes.clientBookingScreen);
              break;
          }
        },
        items: menuItems,
      ),
    );

  }
}