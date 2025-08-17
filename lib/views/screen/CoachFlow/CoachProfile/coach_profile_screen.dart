import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:flutter/material.dart';

class CoachProfileScreen extends StatefulWidget {
  const CoachProfileScreen({super.key});

  @override
  State<CoachProfileScreen> createState() => _CoachProfileScreenState();
}

class _CoachProfileScreenState extends State<CoachProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CoachBottomMenu(4),
    );
  }
}
