import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CoachTabsWidgetScreen extends StatelessWidget {
  final bool isSelected;
  final String tabName;
  final VoidCallback onTap;
  final int? notificationCount;

  const CoachTabsWidgetScreen({
    super.key,
    required this.isSelected,
    required this.tabName,
    required this.onTap,
    this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50), // Adjust vertical padding for spacing
        margin: EdgeInsets.symmetric(horizontal: 10),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          border: isSelected
              ? Border(
            bottom: BorderSide(
              color: AppColors.primaryColor,
              width: 2.0, // Underline thickness
            ),
          )
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              tabName,
              style: TextStyle(
                color: isSelected ? AppColors.primaryColor : Color(0xFF6B7280),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),

          ],
        ),
      ),
    );
  }
}