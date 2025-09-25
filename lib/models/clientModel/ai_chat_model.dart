import 'package:find_me_a_coach/models/clientModel/ai_message_model.dart';

class AIChatModel {
  List<AiMessageModel> aiMessages;

  AIChatModel({List<AiMessageModel>? aiMessages}) : aiMessages = aiMessages ?? [];
}