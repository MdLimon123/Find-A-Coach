import 'package:find_me_a_coach/controllers/clientController/client_chat_controller.dart';
import 'package:find_me_a_coach/controllers/data_controller.dart';
import 'package:find_me_a_coach/models/all_message_model.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_network_image.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

class CoachChatScreen extends StatefulWidget {
  final int id;
  final String name;
  final String image;
  const CoachChatScreen({super.key,
    required this.id,
    required this.name,
    required this.image,});

  @override
  State<CoachChatScreen> createState() => _ClientChatScreenState();
}

class _ClientChatScreenState extends State<CoachChatScreen> {



  final _clientChatController = Get.put(ClientChatController());
  final _dataController = Get.put(DataController());

  @override
  void initState() {
    _dataController.getCoachData();
    _clientChatController.fetchAllMessage(id: _clientChatController.roomId.value);
    _clientChatController.initialize(userId: _dataController.coachId.value, id: _clientChatController.roomId.value);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomChatAppBar(
        image: widget.image,
        name: widget.name,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                    () => _clientChatController.isFirstLoading.value
                    ? Center(child: CustomPageLoading())
                    : Column(
                  children: [
                    Expanded(
                      child: _clientChatController.allChatMessage.isEmpty
                          ? Center(child: Text("Start Chatting now"))
                          : GroupedListView<AllMessageModel, DateTime>(
                        elements: _clientChatController.allChatMessage,
                        controller: _clientChatController.scrollController,
                        order: GroupedListOrder.DESC,
                        itemComparator: (item1, item2) =>
                            (item1.timestamp ?? DateTime.now()).compareTo(item2.timestamp ?? DateTime.now()),
                        groupBy: (message) => DateTime(
                          (message.timestamp ?? DateTime.now()).year,
                          (message.timestamp ?? DateTime.now()).month,
                          (message.timestamp ?? DateTime.now()).day,
                        ),
                        reverse: true,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                        groupSeparatorBuilder: (DateTime date) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Text(
                                DateFormat.yMMMd().format(date),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, color: Colors.grey),
                              ),
                            ),
                          );
                        },
                        itemBuilder: (context, AllMessageModel message) {
                          final bool isSender = message.sender ==  _dataController.coachId.value;
                          return _buildChatMessage(context, message.content, isSender);
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: _clientChatController.messageController,
                    onFieldSubmitted: (v){
                      _clientChatController.sendMessageWithCoach();
                    },
                    hintText: 'Write message....',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _clientChatController.sendMessageWithCoach();
                      },
                      child: Container(
                        height: 32,
                        width: 32,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFB0C4DB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          Icons.send,
                          color: Color(0xFF00428A),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatMessage(
      BuildContext context,
      String message,
      bool isSender,
      ) {
    return Align(
      alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: isSender
              ?Color(0xFF0743A2):
          Color(0xFFE5E7EB),
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: Radius.circular(isSender ? 10 : 0),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(isSender ? 0 : 10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: isSender ?Colors.white: Color(0xFF374151)  ,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                DateFormat.jm().format(DateTime.now()),
                style: TextStyle(
                  fontSize: 11,
                  color: isSender ? Colors.grey: Colors.white70 ,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String image;
  final String name;

  const CustomChatAppBar({super.key,
    required this.image,
    required this.name,});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.textColor,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: Color(0xFF4B5563),
                ),
              ),

              SizedBox(width: 12),

              Stack(
                children: [

                  CustomNetworkImage(
                      imageUrl:"${ApiConstant.imageBaseUrl}$image",
                      boxShape: BoxShape.circle,
                      height: 40,
                      width: 40),
                  // Online Dot
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                        border: Border.all(color: Colors.white, width: 1.5),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(width: 12),


              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF4B5563), // Match screenshot text color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}