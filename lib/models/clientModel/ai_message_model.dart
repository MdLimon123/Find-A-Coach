class AiMessageModel{
  final String message;
  final bool isUser;
  final bool? isLoading;

  AiMessageModel({required this.message, required this.isUser, this.isLoading});
}