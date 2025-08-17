import 'package:find_me_a_coach/helpers/route.dart';
import 'package:find_me_a_coach/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';


import '../../utils/app_colors.dart';

class CoachBottomMenu extends StatelessWidget {
  final int menuIndex;

  const CoachBottomMenu(this.menuIndex, {super.key});

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
      getItem(AppIcons.session, 'Sessions', theme, 1),
      getItem(AppIcons.communityIcon, 'Community', theme, 2),
      getItem(AppIcons.commentIcon, 'Message', theme, 3),
      getItem(AppIcons.profile, 'Profile', theme, 4),
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
              Get.offAndToNamed(AppRoutes.coachHomeScreen);
              break;
            case 1:
              Get.offAndToNamed(AppRoutes.coachSessionScreen);
              break;
            case 2:
              Get.offAndToNamed(AppRoutes.coachCommunityScreen);
              break;
            case 3:
              Get.offAndToNamed(AppRoutes.coachInboxScreen);
              break;
            case 4:
              Get.offAndToNamed(AppRoutes.coachProfileScreen);
              break;
          }
        },
        items: menuItems,
      ),
    );

  }
}