import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:flutter/material.dart';

class CoachCommunityScreen extends StatefulWidget {
  const CoachCommunityScreen({super.key});

  @override
  State<CoachCommunityScreen> createState() => _CoachCommunityScreenState();
}

class _CoachCommunityScreenState extends State<CoachCommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CoachBottomMenu(2),
    );
  }
}
