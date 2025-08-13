import 'package:find_me_a_coach/models/clientModel/ai_chat_model.dart';
import 'package:find_me_a_coach/models/clientModel/ai_message_model.dart';
import 'package:get/get.dart';

class AIChatController extends GetxController{


  var aiCurrentChat = AIChatModel(aiMessages: <AiMessageModel>[].obs).obs;
  var chatHistory = <AIChatModel>[].obs;



  Future<void> sendMessage({required String message})async{

    aiCurrentChat.value.aiMessages.add(AiMessageModel(message: message, isUser: true));
    await Future.delayed(Duration(milliseconds: 500), (){
      aiCurrentChat.value.aiMessages.add(AiMessageModel(message: "Ai response ${message}", isUser: false));
    });
  }


  void createNewChat(){

    if(aiCurrentChat.value.aiMessages.isNotEmpty){
      chatHistory.add(aiCurrentChat.value);
    }
    aiCurrentChat.value = AIChatModel(aiMessages: <AiMessageModel>[].obs);
    aiCurrentChat.refresh();

  }

}