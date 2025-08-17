import 'package:find_me_a_coach/controllers/coachController/coach_ai_chat_controller.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_chat_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoachAiChatScreen extends StatefulWidget {
  const CoachAiChatScreen({super.key});

  @override
  State<CoachAiChatScreen> createState() => _CoachAiChatScreenState();
}

class _CoachAiChatScreenState extends State<CoachAiChatScreen> {

  final messageController = TextEditingController();
  final _coachAiController = Get.put(CoachAiChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: 'AI Coach'),
      endDrawer: Drawer(
        child: Column(
          children: [
            SizedBox(height: 64,),
            ListTile(
              onTap: () {
                _coachAiController.createNewChat();
                Get.back();
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: SvgPicture.asset('assets/icons/new_chat.svg'),
              title: Text(
                'New Chat',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.bigTextColor),
              ),
            ),
            SizedBox(height: 24,),
            ListTile(
              onTap: () {
                Get.to(()=> CoachChatHistoryScreen());
              },
              contentPadding: EdgeInsets.symmetric(horizontal: 24),
              leading: SvgPicture.asset('assets/icons/refresh.svg'),
              title: Text(
                'History',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.bigTextColor),
              ),
            ),
          ],
        ),
      ),

      body: Column(
        children: [
          Expanded(
            child: Obx((){
              final aiMessage = _coachAiController.aiCurrentChat.value.aiMessages;

              if(_coachAiController.showSuggestions.value){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20,),
                        child: Text("Hello! I’m your AI Coach. I’m here to help you achieve your goals. What would you like to focus on today?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF374151)
                        ),),
                      ),
                      SizedBox(height: 40,),
                      ..._coachAiController.suggestions.map((text)=>Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: InkWell(
                          onTap: ()=> _coachAiController.sendMessage(text, fromSuggestion: true),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            height: 38,
                            decoration: BoxDecoration(
                              color: Color(0xFFE6ECF3),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Color(0xFF3368A1),
                              width: 0.5)
                            ),
                            child: Text(text,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF00428A),
                              fontSize: 14
                            ),),
                          ),
                        ),
                      ))
                    ],
                  ),
                );
              }
              return  ListView.builder(
                  itemCount: aiMessage.length,
                  itemBuilder: (context, index){
                    final message = aiMessage[index];
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
                  });
            }),
          ),
          _buildMessageInput()
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

                  if(messageController.text.isNotEmpty){
                    _coachAiController.sendMessage(value);
                    messageController.clear();
                  }

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
                            if(messageController.text.isNotEmpty){
                              _coachAiController.sendMessage(messageController.text);
                              messageController.clear();
                            }
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
