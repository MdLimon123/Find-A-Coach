import 'dart:convert';

import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/models/all_message_model.dart';
import 'package:find_me_a_coach/models/clientModel/client_inbox_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/services/socket_manager.dart';
import 'package:find_me_a_coach/views/base/customSnackbar.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachChat/coach_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ClientChatController extends GetxController{


 final isChatCreateLoading = false.obs;
  final isFirstLoading = false.obs;
  final isInboxLoading = false.obs;

  ScrollController scrollController = ScrollController();
  final TextEditingController messageController = TextEditingController();

  final _dataController = Get.put(DataController());
  var roomId = 0.obs;

  RxList<AllMessageModel> allChatMessage = <AllMessageModel>[].obs;
  RxList<ClientInboxModel> clientInboxModel = <ClientInboxModel>[].obs;


  @override
  void onClose() {
    SocketApi.disconnect();
    super.onClose();
  }


  bool _socketInitialized = false;

  Future<void> initialize({required int userId, required int id}) async {
    if (_socketInitialized) return;
    _socketInitialized = true;

    SocketApi.init(id);

    SocketApi.messageStream.listen((data) {
      try {
        final Map<String, dynamic> map = jsonDecode(data) as Map<String, dynamic>;
        final content = (map['content'] ?? map['message'] ?? '').toString();
        final images = map['images'] != null ? List<String>.from(map['images']) : null;


        if (content.trim().isEmpty && (images == null || images.isEmpty)) {
          return;
        }

        final msg = AllMessageModel.fromJson(map);


        allChatMessage.add(msg);


        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!scrollController.hasClients) return;


          final isReversed = true;
          final target = isReversed
              ? scrollController.position.minScrollExtent
              : scrollController.position.maxScrollExtent;

          scrollController.animateTo(
            target,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      } catch (e, st) {
        print('Socket parse error: $e\n$st');
      }
    });
  }

  //
  // void initialize({required int userId, required int id}){
  //   _dataController.id.value = userId;
  //
  //   SocketApi.init(id);
  //
  //   SocketApi.messageStream.listen((data) {
  //     final msg = AllMessageModel.fromJson(jsonDecode(data));
  //     allChatMessage.add(msg);
  //
  //     WidgetsBinding.instance.addPostFrameCallback((_) {
  //       if (scrollController.hasClients) {
  //         scrollController.animateTo(
  //           scrollController.position.maxScrollExtent,
  //           duration: const Duration(milliseconds: 300),
  //           curve: Curves.easeOut,
  //         );
  //       }
  //     });
  //   });
  //
  // }

  /// send message

  void sendMessageWithClient() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    final payload = {
      'sender': _dataController.id.value,
      'message': text,

    };



    SocketApi.emit(payload);
    messageController.clear();
  }


  void sendMessageWithCoach() {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    final payload = {
      'sender': _dataController.coachId.value,
      'message': text,

    };



    SocketApi.emit(payload);
    messageController.clear();
  }

  // void sendMessage(){
  //   _dataController.getUserData();
  //   final text = messageController.text.trim();
  //   if(text.isEmpty) return;
  //   final message = {
  //     "sender": _dataController.id.value,
  //     "message": text,
  //   };
  //
  //   SocketApi.emit(message);
  //   allChatMessage.add(AllMessageModel(
  //     sender: _dataController.id.value,
  //     content: text,
  //     timestamp: DateTime.now(),
  //   ));
  //   print("All Chat Message =============> $allChatMessage");
  //   messageController.clear();
  //
  // }



  /// create first chat with coach
  Future<void> createChatWithCoach({required int id, required String name, required String image})async{

    isChatCreateLoading(true);
    final body = {
      "user2": id
    };

    final response = await ApiClient.postData(ApiConstant.createChatEndPoint, json.encode(body));

    if(response.statusCode == 200 || response.statusCode == 201){
      roomId.value = response.body["room_id"];
      Get.to(() => CoachChatScreen(id: id, name: name, image: image));
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isChatCreateLoading(false);

  }

  /// fetch all message
  Future<void> fetchAllMessage({required int id})async{
    isFirstLoading(true);
    final response = await ApiClient.getData(ApiConstant.messageEndPoint(id: id));
    if(response.statusCode == 200 || response.statusCode == 201){
      final List<dynamic> data = response.body;
      final List<AllMessageModel> message = data.map((e) => AllMessageModel.fromJson(e)).toList();
      allChatMessage.addAll(message);
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isFirstLoading(false);

  }

  Future<void> fetchInboxMessage()async{

    isInboxLoading(true);

    final response = await ApiClient.getData(ApiConstant.inboxEndPoint);
    if(response.statusCode == 200){
      final List<dynamic> data = response.body;
      final List<ClientInboxModel> message = data.map((e) => ClientInboxModel.fromJson(e)).toList();
      clientInboxModel.addAll(message);
    }else{
      showCustomSnackBar("Something went wrong", isError: true);
    }
    isInboxLoading(false);

  }
}