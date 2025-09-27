import 'package:find_me_a_coach/controllers/coachController/coach_ai_history_controller.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoachAiChatHistoryScreen extends StatefulWidget {

  final String id;

  const CoachAiChatHistoryScreen({super.key, required this.id});

  @override
  State<CoachAiChatHistoryScreen> createState() => _CoachAiChatHistoryScreenState();
}

class _CoachAiChatHistoryScreenState extends State<CoachAiChatHistoryScreen> {

 final _coachAiChatHistoryController = Get.put(CoachAiHistoryController());
  final messageController = TextEditingController();
 final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _coachAiChatHistoryController.fetchSingleHistory(id: widget.id);
    });
    super.initState();
  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "AI Coach Chat History"),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Expanded(
            child: Obx(() {
              final messages = _coachAiChatHistoryController.aiCurrentChat;
              final loading = _coachAiChatHistoryController.isSingleHistoryLoading.value;

              if (loading) {

                return  Center(
                  child: CustomPageLoading(),
                );
              }
              WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
              return messages.isEmpty
                  ? const Center(
                child: Text(
                  "No History available",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF374151),
                  ),
                ),
              )

                  : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[index];

                  if (message.type == 'json') {
                    return _buildCoachCard(message.jsonData!['coaches']);
                  }
                  else if (message.type == 'p-json') {
                    final phases = message.jsonData!['phases'] as List;
                    return _buildPhasePlanCard(phases);
                  }
                  else {
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
                          borderRadius: message.isUser
                              ? BorderRadius.circular(8)
                              : null,
                        ),
                        child: Text(
                          message.message,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF4B5563),
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            }),
          ),

          _buildMessageInput(),
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
                 _coachAiChatHistoryController.sendMessage(
                   sessionId: widget.id,
                   message: messageController.text,
                 );
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

                           _coachAiChatHistoryController.sendMessage(
                             sessionId: widget.id,
                             message: messageController.text,
                           );
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