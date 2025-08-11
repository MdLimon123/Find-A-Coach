import 'dart:ui';

import 'package:flutter/cupertino.dart';

class AppColors{
  
  static Color primaryColor=const Color(0xFF00428A);
  static Color primaryColor50 = Color(0xFFE6ECF3);
  static Color backgroundColor=const Color(0xFFEEF5FD);
  static Color cardColor = const Color(0xFF2F2F2F);
  static Color cardLightColor = const Color(0xFF555555);
  static Color borderColor = const Color(0xFFB0C4DB);
  static Color textColor = const Color(0xFFFFFFFF);
  static Color bigTextColor = const Color(0xFF4B5563);
  static Color fillTextColor = const Color(0xFF6B7280);
  static Color subTextColor = const Color(0xFFE8E8E8);
  static Color smallTextColor = const Color(0xFF6B7280);
  static Color hintColor = const Color(0xFFB5B5B5);
  static Color greyColor = const Color(0xFFB5B5B5);
  static Color fillColor = const Color(0xFFE9F3FD).withValues(alpha: 0.3);
  static Color dividerColor = const Color(0xFF555555);
  static Color shadowColor = const Color(0xFF2B2A2A);
  static Color bottomBarColor = const Color(0xFF343434);

  static BoxShadow shadow=BoxShadow(
    blurRadius: 4,
    spreadRadius: 0,
    color: shadowColor,
    offset: const Offset(0, 2),
  );
}