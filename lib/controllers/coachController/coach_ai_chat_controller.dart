import 'package:find_me_a_coach/models/clientModel/ai_chat_model.dart';
import 'package:find_me_a_coach/models/clientModel/ai_message_model.dart';
import 'package:get/get.dart';

class CoachAiChatController extends GetxController{


  var aiCurrentChat = AIChatModel(aiMessages: <AiMessageModel>[].obs).obs;
  var chatHistory = <AIChatModel>[].obs;
  RxBool showSuggestions = true.obs;

  final List<String> suggestions = [
    "Mindset Development",
    "Confidence Building",
    "Wellness & Balance",
    "Career Growth"
  ];

  Future<void> sendMessage( String message, {bool fromSuggestion = false})async{

    aiCurrentChat.value.aiMessages.add(AiMessageModel(message: message, isUser: true));
    showSuggestions.value = false;
    await Future.delayed(Duration(milliseconds: 500), (){
      aiCurrentChat.value.aiMessages.add(AiMessageModel(message: "Ai response $message", isUser: false));
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