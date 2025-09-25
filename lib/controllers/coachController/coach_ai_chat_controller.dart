import 'dart:convert';

import 'package:find_me_a_coach/models/clientModel/ai_chat_model.dart';
import 'package:find_me_a_coach/models/clientModel/ai_message_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/base/custom_snackbar.dart';

class CoachAiChatController extends GetxController{


  var aiCurrentChat = AIChatModel(aiMessages: <AiMessageModel>[].obs).obs;
  var chatHistory = <AIChatModel>[].obs;

  var sessionId = ''.obs;

  final isSessionLoading = false.obs;

  final isLoading = false.obs;

  RxBool showSuggestions = true.obs;

  final List<String> suggestions = [
    "Mindset Development",
    "Confidence Building",
    "Wellness & Balance",
    "Career Growth"
  ];



  /// Send a message to the API and handle both `text` and `json` responses.
  Future<void> sendCoachMessage({required String message, bool fromSuggestion = false}) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty) return;


    aiCurrentChat.value.aiMessages.add(AiMessageModel(message: trimmed, isUser: true));
    /// Add a loading placeholder message
    showSuggestions.value = false;
    aiCurrentChat.value.aiMessages
        .add(AiMessageModel(message: 'loading....', isUser: false, isLoading: true));


    isLoading.value = true;
    aiCurrentChat.refresh();


    final body = {
      "session_id": sessionId.value,
      "question": trimmed,
      "type": "user",
    };


    try {
      final response = await ApiClient.postData(ApiConstant.aiAssistanceEndPoint, jsonEncode(body))
          .timeout(const Duration(seconds: 60));


      /// Remove loading placeholders
      aiCurrentChat.value.aiMessages.removeWhere((m) => m.isLoading == true);


      dynamic data;
      if (response.body is String) {
        data = jsonDecode(response.body);
      } else if (response.body is Map) {
        data = response.body;
      } else {
        /// If the API client returns a different shape, adapt here.
        throw Exception('Invalid response type from API');
      }


      final type = (data['type'] ?? 'text').toString();


      if (type == 'text') {
        final aiMessageText = data['response']?.toString() ?? 'No Message From AI';
        aiCurrentChat.value.aiMessages.add(
          AiMessageModel(message: aiMessageText, isUser: false, type: 'text'),
        );
      } else if (type == 'json') {
        final resp = data['response'];
        final List coaches = resp is List ? resp : [resp];
        aiCurrentChat.value.aiMessages.add(
          AiMessageModel(
            message: '',
            isUser: false,
            type: 'json',
            jsonData: {'coaches': coaches},
          ),
        );
      } else {
        /// fallback — treat as text
        final fallback = data['response']?.toString() ?? 'No Message';
        aiCurrentChat.value.aiMessages.add(AiMessageModel(message: fallback, isUser: false));
      }
    } catch (e, st) {
      /// Remove loading placeholder and add an error message
      aiCurrentChat.value.aiMessages.removeWhere((m) => m.isLoading == true);
      aiCurrentChat.value.aiMessages.add(AiMessageModel(message: 'Something went wrong', isUser: false));
      /// Log for debugging
      debugPrint('AiChatController.sendMessage error: $e\n$st');
    } finally {
      isLoading.value = false;
      aiCurrentChat.refresh();
    }
  }


  void createNewChat(){

    if(aiCurrentChat.value.aiMessages.isNotEmpty){
      chatHistory.add(aiCurrentChat.value);
    }
    aiCurrentChat.value = AIChatModel(aiMessages: <AiMessageModel>[].obs);
    aiCurrentChat.refresh();

  }
/// Create a new session with the AI
  Future<void> createSession()async{

    isSessionLoading(true);

    final response = await ApiClient.postData(ApiConstant.newSessionEndPoint, null);

    if(response.statusCode == 200 || response.statusCode == 201){

      sessionId.value = response.body['session_id'] ?? '';
      Get.to(()=> CoachAiChatScreen());
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isSessionLoading(false);


  }

}