import 'package:find_me_a_coach/controllers/coachController/coach_ai_chat_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }


  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      final max = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        max + 100,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }


  void _onSendPressed() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;
    _coachAiController.sendCoachMessage(message: text);
    messageController.clear();


    /// Small delay so the UI can add the user message before scrolling
    Future.delayed(const Duration(milliseconds: 50), () => _scrollToBottom());
  }

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
              final messages = _coachAiController.aiCurrentChat.value.aiMessages;

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
                          onTap: ()=> _coachAiController.sendCoachMessage(message: text, fromSuggestion: true),
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
              WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
              return ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(vertical: 12),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];


                  /// JSON response -> coach cards
                  if (message.type == 'json' && message.jsonData != null) {
                    final coaches = message.jsonData!['coaches'] as List;
                    return Align(alignment: Alignment.centerLeft,
                        child: _buildCoachCard(coaches));
                  }


                  /// Normal text bubble
                  return Align(
                    alignment: message.isUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message.isUser
                            ? const Color(0xFFE5E7EB)
                            : Colors.transparent,
                        borderRadius: message.isUser ? BorderRadius.circular(
                            8) : BorderRadius.circular(0),
                      ),
                      child: Text(
                        message.message,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: message.isUser
                              ? const Color(0xFF374151)
                              : const Color(0xFF4B5563),
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          _buildMessageInput()
        ],
      ),
    );
  }

  Widget _buildCoachCard(List coaches) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: coaches.map((c) {
          final name = c['full_name'] ?? '';
          final gender = c['gender'] ?? '';
          final location = c['location'] ?? '';
          final areas = (c['coaching_area_names'] as List?)?.join(', ') ?? '';
          final certs = (c['certifications'] as List?)?.join(', ') ?? '';
          final language = (c['language'] as List?)?.join(', ') ?? '';
          final imageUrl = c['image'] ?? c['image'];


          return Card(
            margin: const EdgeInsets.symmetric(vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  CustomNetworkImage(
                      imageUrl: "${ApiConstant.imageBaseUrl}$imageUrl}",
                      boxShape: BoxShape.circle,
                      height: 30,
                      width: 30),

                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        const SizedBox(height: 6),
                        Text('Gender: $gender',
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF6B7280)),

                        ),
                        const SizedBox(height: 4),
                        Text('Areas: $areas',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF6B7280))),
                        const SizedBox(height: 4),
                        if (certs.isNotEmpty) Text('Certifications: $certs',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF6B7280))),
                        const SizedBox(height: 4),
                        if (language.isNotEmpty) Text('Language: $language',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF6B7280))),
                        const SizedBox(height: 4),
                        Text('Location: $location',
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF6B7280))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: messageController,
              onFieldSubmitted: (_) => _onSendPressed(),
              textInputAction: TextInputAction.send,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFF6B7280)),
              decoration: InputDecoration(
                fillColor: const Color(0xFFFFFFFF),
                filled: true,
                hintText: 'Message AI Coach',
                hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFBABABA)),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF8DA9D4))),
                focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF8DA9D4))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF8DA9D4))),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFFB0C4DB)),
            child: IconButton(
              icon: const Icon(Icons.arrow_upward_outlined),
              color: AppColors.primaryColor,
              onPressed: _onSendPressed,
            ),
          ),
        ],
      ),
    );
  }
}
