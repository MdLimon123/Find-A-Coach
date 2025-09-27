import 'dart:convert';

import 'package:find_me_a_coach/models/clientModel/ai_chat_history_model.dart';
import 'package:find_me_a_coach/models/clientModel/ai_message_model.dart';
import 'package:find_me_a_coach/models/clientModel/single_historyModel.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:get/get.dart';

import '../../views/base/custom_snackbar.dart';

class AiChatHistoryController extends GetxController{

  RxBool isLoading = false.obs;
  RxList<AiMessageModel> aiCurrentChat = <AiMessageModel>[].obs;
  RxList<SessionModel> allHistoryList = <SessionModel>[].obs;

  var singleHistoryList = SingleHistoryModel( messages: <ChatMessage>[].obs).obs;
  final historyLoading = false.obs;
  final isDeleteLoading = false.obs;

  final isSingleHistoryLoading = false.obs;

/// fetch all history
  Future<void> fetchAllHistory()async{

    historyLoading(true);

    final response = await ApiClient.getData(ApiConstant.allHistoryEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['sessions'];
      allHistoryList.value = data.map((e) => SessionModel.fromJson(e)).toList();
    }else{

      showCustomSnackBar("Something went wrong", isError: true);

    }
    historyLoading(false);

  }

  /// delete session
  Future<void> deleteSession({required String id})async{

    isDeleteLoading(true);
    final response = await ApiClient.deleteData(ApiConstant.deleteSessionEndPoint(id: id));
    if(response.statusCode == 200){
      showCustomSnackBar(response.body['message'], isError: false);
      Get.back();
      fetchAllHistory();

    }else{
      showCustomSnackBar(response.body['message'], isError: true);
    }
    isDeleteLoading(false);
  }

  /// rename session
  Future<void> renameChatHistory({required String sessionId, required String newTitle})async{

    final body = {
      "session_id": sessionId,
      "new_title": newTitle
    };

    final response = await ApiClient.putData(ApiConstant.renameSessionEndPoint, body);
    if(response.statusCode == 200 || response.statusCode == 201) {

      showCustomSnackBar(response.body['detail'], isError: false);
      Get.back();
      fetchAllHistory();

    }else{
      showCustomSnackBar(response.body['detail'], isError: true);

    }


  }


  /// Merge old chat history to aiCurrentChat
  // void mergeHistoryToCurrentChat() {
  //   aiCurrentChat.clear();
  //
  //   for (var msg in singleHistoryList.value.messages) {
  //
  //     if (msg.role == 'user' && msg.content != null) {
  //       aiCurrentChat.add(AiMessageModel(
  //         message: msg.content!,
  //         isUser: true,
  //         type: 'text',
  //       ));
  //     }
  //
  //
  //     if (msg.role == 'assistant' && msg.content != null) {
  //
  //       if (msg.type == 'json') {
  //         final resp = jsonDecode(msg.content!);
  //         final List coaches = resp is List ? resp : [resp];
  //         aiCurrentChat.add(AiMessageModel(
  //           message: '',
  //           isUser: false,
  //           type: 'json',
  //           jsonData: {'coaches': coaches},
  //         ));
  //       } else {
  //         aiCurrentChat.add(AiMessageModel(
  //           message: msg.content!,
  //           isUser: false,
  //           type: 'text',
  //         ));
  //       }
  //     }
  //   }
  //
  //   aiCurrentChat.refresh();
  // }

  void mergeHistoryToCurrentChat() {
    aiCurrentChat.clear();

    for (var msg in singleHistoryList.value.messages) {
      if (msg.role == 'user' && msg.content != null) {
        aiCurrentChat.add(AiMessageModel(
          message: msg.content!,
          isUser: true,
          type: 'text',
        ));
      }

      if (msg.role == 'assistant' && msg.content != null) {

        if (msg.type == 'json') {
          final resp = jsonDecode(msg.content!);
          final List coaches = resp is List ? resp : [resp];
          aiCurrentChat.add(AiMessageModel(
            message: '',
            isUser: false,
            type: 'json',
            jsonData: {'coaches': coaches},
          ));


        } else if (msg.type == 'p-json') {
          try {
            final parsed = jsonDecode(msg.content!);
            final List phases = parsed is List ? parsed : [parsed];
            aiCurrentChat.add(AiMessageModel(
              message: '',
              isUser: false,
              type: 'p-json',
              jsonData: {'phases': phases},
            ));
          } catch (e) {

            aiCurrentChat.add(AiMessageModel(
              message: msg.content!,
              isUser: false,
              type: 'text',
            ));
          }


        } else {
          aiCurrentChat.add(AiMessageModel(
            message: msg.content!,
            isUser: false,
            type: 'text',
          ));
        }
      }
    }

    aiCurrentChat.refresh();
  }


  Future<void> sendMessage({required String message, required String sessionId}) async {
    final trimmed = message.trim();
    if (trimmed.isEmpty) return;

    // Add user message
    aiCurrentChat.add(AiMessageModel(message: trimmed, isUser: true));

    // Loading placeholder
    aiCurrentChat.add(AiMessageModel(message: 'loading....', isUser: false, isLoading: true));
    isLoading.value = true;
    aiCurrentChat.refresh();

    final body = {"session_id": sessionId, "question": trimmed, "type": "user"};

    try {
      final response = await ApiClient.postData(ApiConstant.aiAssistanceEndPoint, jsonEncode(body))
          .timeout(const Duration(seconds: 60));

      aiCurrentChat.removeWhere((m) => m.isLoading == true);

      dynamic data = response.body is String ? jsonDecode(response.body) : response.body;
      final type = (data['type'] ?? 'text').toString();

      if (type == 'text') {
        aiCurrentChat.add(AiMessageModel(
          message: data['response']?.toString() ?? 'No Message From AI',
          isUser: false,
        ));
      } else if (type == 'json') {
        final resp = data['response'];
        final List coaches = resp is List ? resp : [resp];
        aiCurrentChat.add(AiMessageModel(
          message: '',
          isUser: false,
          type: 'json',
          jsonData: {'coaches': coaches},
        ));
      } else if(type == 'p-json'){
        final resp = data['response'];
        final List phases = resp is List ? resp : [resp];
        aiCurrentChat.add(
          AiMessageModel(
            message: '',
            isUser: false,
            type: 'p-json',
            jsonData: {'phases': phases},
          ),
        );
      }
      else {
        aiCurrentChat.add(AiMessageModel(
          message: data['response']?.toString() ?? 'No Message',
          isUser: false,
        ));
      }

      aiCurrentChat.refresh();
    } catch (e) {
      aiCurrentChat.removeWhere((m) => m.isLoading == true);
      aiCurrentChat.add(AiMessageModel(message: 'Something went wrong', isUser: false));
    } finally {
      isLoading.value = false;
      aiCurrentChat.refresh();
    }
  }



  /// Fetch previous chat history
  Future<void> fetchSingleHistory({required String id}) async {
    isSingleHistoryLoading(true);

    final response = await ApiClient.getData(ApiConstant.getAllHistorySessionEndPoint(id: id));

    if (response.statusCode == 200) {
      final singleHistory = SingleHistoryModel.fromJson(response.body);

      singleHistoryList.value.messages.clear();
      singleHistoryList.value.messages.addAll(singleHistory.messages);
      singleHistoryList.refresh();

      /// Merge old messages to current chat
      mergeHistoryToCurrentChat();
    } else {
      /// Handle error
      print("Something went wrong while fetching history");
    }

    isSingleHistoryLoading(false);
  }





}