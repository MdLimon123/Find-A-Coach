import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachChatScreen extends StatefulWidget {
  const CoachChatScreen({super.key});

  @override
  State<CoachChatScreen> createState() => _ClientChatScreenState();
}

class _ClientChatScreenState extends State<CoachChatScreen> {
  final sendMessageTextController = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {
      "text": "Hello, how can I assist you today?",
      "time": "10:00 AM",
      "isMe": true,
    },
    {
      "text": "Hello, how can I assist you today?",
      "time": "10:00 AM",
      "isMe": false,
    },
    {
      "text": "Hello, how can I assist you today?",
      "time": "10:00 AM",
      "isMe": true,
    }
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomChatAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];
                  return Align(
                    alignment: message['isMe']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      padding: EdgeInsets.symmetric(
                          horizontal: 12, vertical: 10),
                      constraints: BoxConstraints(maxWidth: 280),
                      decoration: BoxDecoration(
                          color: message['isMe']
                              ? AppColors.primaryColor
                              : const Color(0xFFE5E7EB),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(
                                message['isMe'] ? 16 : 0),
                            topRight: Radius.circular(
                                message['isMe'] ? 0 : 16),
                          )

                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            child: Text(
                              message['text'],
                              style: TextStyle(
                                fontSize: 14,
                                color: message['isMe']
                                    ? AppColors.textColor
                                    : const Color(0xFF374151),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                message['time'],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: message['isMe']
                                      ? Color(0xFF8DA9D4)
                                      : const Color(0xFF9CA3AF),
                                ),
                              ),
                              if (message['isMe']) ...[
                                SizedBox(height: 2),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check,
                                        size: 12, color: Color(0xFF03A003)),
                                    Icon(Icons.check,
                                        size: 12, color: Color(0xFF03A003)),
                                  ],
                                )
                              ],
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),


            ),

            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: sendMessageTextController,
                    hintText: 'Write message....',
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 32,
                        width: 32,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFB0C4DB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.send,
                          color: Color(0xFF00428A),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(
      BuildContext context,
      String message,
      bool isSender,
      ) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSender
              ? Color(0xFFE5E7EB)
              : Color(0xFF0743A2), // orange or light gray
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: Radius.circular(isSender ? 10 : 0),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(isSender ? 0 : 10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isSender ? Color(0xFF374151) : Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "3:30 PM",
                style: TextStyle(
                  fontSize: 11,
                  color: isSender ? Colors.white70 : Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.textColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Color(0xFF4B5563),
                ),
              ),

              SizedBox(width: 12),

              Stack(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/person.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Online Dot
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: 12),

              // User Name
              Text(
                "Savannah Nguyen",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B5563), // Match screenshot text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}