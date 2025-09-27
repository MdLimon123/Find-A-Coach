import 'package:find_me_a_coach/controllers/clientController/ai_chat_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/screen/ClientFlow/AiChatBoot/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AiChatScreen extends StatefulWidget {
  const AiChatScreen({super.key});

  @override
  State<AiChatScreen> createState() => _AiChatScreenState();
}

class _AiChatScreenState extends State<AiChatScreen> {

  final _aiChatController = Get.put(AIChatController());
  final ScrollController _scrollController = ScrollController();
  final messageController = TextEditingController();


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
    _aiChatController.sendMessage(message: text);
    messageController.clear();


    /// Small delay so the UI can add the user message before scrolling
    Future.delayed(const Duration(milliseconds: 50), () => _scrollToBottom());
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "AI Coach"),
        endDrawer: Drawer(
                child: Column(
                  children: [
                    SizedBox(height: 64,),
                    ListTile(
                      onTap: () {
                        _aiChatController.createNewChat();
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
                        Get.to(()=> HistoryScreen());
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
         body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                final messages = _aiChatController.aiCurrentChat.value
                    .aiMessages;
                if (messages.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        "Hello! I’m your AI Coach. I’m here to help you achieve your goals. What would you like to focus on today?",
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF374151)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }


            /// Ensure we scroll after the frame builds
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    _scrollToBottom());


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


                    if(message.type == 'p-json' && message.jsonData !=null){
                      final phases = message.jsonData!['phases'] as List;
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: _buildPhasePlanCard(phases),
                      );
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


            /// message input
            _buildMessageInput(),
          ],
        ),
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

  Widget _buildPhasePlanCard(List phases) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: phases.map((p) {
          final phase = p['phase'] ?? '';
          final duration = p['duration'] ?? '';
          final List steps = (p['steps'] as List?) ?? [];
          final List tips = (p['tips'] as List?) ?? [];

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Phase Title
                  Text(
                    phase,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1F2937),
                    ),
                  ),
                  const SizedBox(height: 4),

                  /// Duration
                  Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                  const SizedBox(height: 12),

                  /// Steps
                  if (steps.isNotEmpty) ...[
                    const Text(
                      "Steps:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: steps
                          .map((s) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4B5563))),
                            Expanded(
                              child: Text(
                                s.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                          .toList(),
                    ),
                  ],

                  const SizedBox(height: 12),

                  /// Tips
                  if (tips.isNotEmpty) ...[
                    const Text(
                      "Tips:",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF374151),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: tips
                          .map((t) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("• ",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF4B5563))),
                            Expanded(
                              child: Text(
                                t.toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4B5563),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                          .toList(),
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }


}
