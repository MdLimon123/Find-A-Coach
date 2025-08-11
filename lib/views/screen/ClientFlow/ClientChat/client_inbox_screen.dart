import 'package:find_me_a_coach/views/base/client_bottom_menu..dart';
import 'package:flutter/material.dart';

class ClientInboxScreen extends StatelessWidget {
  const ClientInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      bottomNavigationBar: ClientBottomMenu(3),
    );
  }
}