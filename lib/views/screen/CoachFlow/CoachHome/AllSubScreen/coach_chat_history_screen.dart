import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/screen/CoachFlow/CoachHome/AllSubScreen/coach_ai_chat_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CoachChatHistoryScreen extends StatefulWidget {
  const CoachChatHistoryScreen({super.key});

  @override
  State<CoachChatHistoryScreen> createState() => _CoachChatHistoryScreenState();
}

class _CoachChatHistoryScreenState extends State<CoachChatHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.textColor,
      appBar: CustomAppbar(title: "History"),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(vertical: 12),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {

              Get.to(()=> CoachAiChatHistoryScreen());
            },
            child: Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFE6ECF3),
                borderRadius: BorderRadius.circular(10),

              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Chat Name",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'rename') {
                        _showRenameDialog(context);
                      } else if (value == 'delete') {
                        _showDeleteDialog(context);
                      }
                    },
                    icon: Icon(Icons.more_horiz, color: Color(0xFF4B5563)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Colors.white,
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem(
                          value: 'rename',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/edit.svg',
                                color: Color(0xFF4B5563),
                                height: 18,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Rename',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.bigTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icons/delete.svg',
                                height: 18,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.bigTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ];
                    },
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 6),
        itemCount: 5,
      ),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete Chat"),
          content: Text("Are you sure you want to delete this chat?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  void _showRenameDialog(BuildContext context) {
    final renameTextController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Rename Chat"),
          content: TextField(
            controller: renameTextController,
            decoration: InputDecoration(hintText: "Enter new chat name"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
