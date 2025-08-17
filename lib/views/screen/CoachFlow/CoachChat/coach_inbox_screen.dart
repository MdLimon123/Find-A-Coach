import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:flutter/material.dart';

class CoachInboxScreen extends StatefulWidget {
  const CoachInboxScreen({super.key});

  @override
  State<CoachInboxScreen> createState() => _CoachInboxScreenState();
}

class _CoachInboxScreenState extends State<CoachInboxScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CoachBottomMenu(3),
    );
  }
}
