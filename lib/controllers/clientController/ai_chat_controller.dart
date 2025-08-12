import 'package:find_me_a_coach/models/clientModel/ai_chat_model.dart';
import 'package:find_me_a_coach/models/clientModel/ai_message_model.dart';
import 'package:get/get.dart';

class AIChatController extends GetxController{


  var aiCurrentChat = AIChatModel(aiMessages: <AiMessageModel>[].obs).obs;


  Future<void> sendMessage({required String message})async{

    aiCurrentChat.value.aiMessages.add(AiMessageModel(message: message, isUser: true));
    aiCurrentChat.value.aiMessages.add(AiMessageModel(message: "loading...", isUser: false, isLoading: true));
    await Future.delayed(Duration(seconds: 2));
  }

}