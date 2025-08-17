import 'package:find_me_a_coach/views/base/coach_bottom_menu.dart';
import 'package:flutter/material.dart';

class CoachSessionScreen extends StatefulWidget {
  const CoachSessionScreen({super.key});

  @override
  State<CoachSessionScreen> createState() => _CoachSessionScreenState();
}

class _CoachSessionScreenState extends State<CoachSessionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CoachBottomMenu(1),
    );
  }
}
