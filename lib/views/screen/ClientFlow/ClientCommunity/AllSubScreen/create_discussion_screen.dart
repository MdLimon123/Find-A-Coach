import 'package:find_me_a_coach/controllers/clientController/client_community_controller.dart';
import 'package:find_me_a_coach/models/coachModel/topic_model.dart';
import 'package:find_me_a_coach/utils/app_colors.dart';
import 'package:find_me_a_coach/views/base/custom_appbar.dart';
import 'package:find_me_a_coach/views/base/custom_button.dart';
import 'package:find_me_a_coach/views/base/custom_page_loading.dart';
import 'package:find_me_a_coach/views/base/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateDiscussionScreen extends StatefulWidget {
  const CreateDiscussionScreen({super.key});

  @override
  State<CreateDiscussionScreen> createState() => _CreateDiscussionScreenState();
}

class _CreateDiscussionScreenState extends State<CreateDiscussionScreen> {
  final topicTextController = TextEditingController();
  final askTextController = TextEditingController();

  final _clientCommunityController = Get.put(ClientCommunityController());

  @override
  void initState() {
    _clientCommunityController.fetchAllTopic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: CustomAppbar(title: "create_discussion".tr),
      body: Obx((){
        if(_clientCommunityController.isTopicLoading.value){
          return Center(child: CustomPageLoading());
        }
        if(_clientCommunityController.topicList.isEmpty){
          return Center(child: Text("No Topic Found"));
        }

        int? id = _clientCommunityController.selectedTopic.value?.id;

       return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "topic".tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                      SizedBox(height: 8),
                      DropdownButtonFormField<TopicModel>(
                        value: _clientCommunityController.selectedTopic.value,
                        decoration: InputDecoration(
                          hintText: 'select_topic'.tr,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.borderColor,
                                  width: 1)
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.borderColor,
                                  width: 1)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: AppColors.borderColor,
                                  width: 1)
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        icon:  Icon(Icons.keyboard_arrow_down,
                            color: AppColors.bigTextColor),
                        items: _clientCommunityController.topicList.map((topic) {
                          return DropdownMenuItem<TopicModel>(
                            value: topic,
                            child: Text(topic.name),
                          );
                        }).toList(),
                        onChanged: (value) {
                          _clientCommunityController.selectedTopic.value = value;
                          topicTextController.text = value?.name ?? '';
                        },
                      ),
                      SizedBox(height: 16),
                      Text(
                        "write_your_post".tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4B5563),
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomTextField(
                        controller: askTextController,
                        maxLines: 5,
                        minLines: null,
                        hintText: 'ask_a_question'.tr,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(
              ()=> CustomButton(
                  loading: _clientCommunityController.isPostLoading.value,
                  onTap: () {
                    _clientCommunityController.submitPost(
                      topic: id!,
                      content: askTextController.text,
                    );
                  },
                  text: "post".tr,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
