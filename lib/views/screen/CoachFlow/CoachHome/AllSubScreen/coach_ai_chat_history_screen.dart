import 'package:find_me_a_coach/controllers/coachController/coach_ai_chat_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachAiChatHistoryScreen extends StatefulWidget {
  const CoachAiChatHistoryScreen({super.key});

  @override
  State<CoachAiChatHistoryScreen> createState() => _CoachAiChatHistoryScreenState();
}

class _CoachAiChatHistoryScreenState extends State<CoachAiChatHistoryScreen> {

 final _coachAiChatController = Get.put(CoachAiChatController());
  final messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "AI Coach Chat History"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Obx((){
            final text = _coachAiChatController.aiCurrentChat.value.aiMessages;
            return Expanded(child: text.isEmpty?
            Center(child: Text("Hello! I’m your AI Coach. I’m here to help you achieve your goals. What would you like to focus on today?",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF374151)
              ),
              textAlign: TextAlign.center,)):
            ListView.builder(
                itemCount: text.length,
                itemBuilder: (context, index){
                  final message = text[index];
                  return Align(
                    alignment: message.isUser?Alignment.centerRight:Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: message.isUser? Color(0xFFE5E7EB):Colors.transparent,
                          borderRadius: message.isUser? BorderRadius.circular(8): null),
                      child: Text(message.message,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: message.isUser?Color(0xFF374151):Color(0xFF4B5563),
                      ),),
                    ),

                  );
                }));

          }),

          _buildMessageInput(),
        ],
      ),
    );
  }

  _buildMessageInput() {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                controller: messageController,
                onFieldSubmitted: (value){
                  _coachAiChatController.sendMessage(value);
                  messageController.clear();
                },
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF6B7280)
                ),
                decoration: InputDecoration(
                    fillColor: Color(0xFFFFFFFF),
                    filled: true,
                    hintText: 'Message AI Coach',
                    hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFBABABA)
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF8DA9D4)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF8DA9D4)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Color(0xFF8DA9D4)),
                    ),
                    suffixIcon:Container(
                        height: 18,
                        margin: EdgeInsets.only(right: 8),
                        width: 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xFFB0C4DB)),
                        child: IconButton(
                          onPressed: () {

                            _coachAiChatController.sendMessage(messageController.text);
                            messageController.clear();


                          },
                          icon: Icon(
                            Icons.arrow_upward_outlined,
                            color: AppColors.primaryColor,
                          ),
                        ))
                ))
          ],
        ));
  }
}