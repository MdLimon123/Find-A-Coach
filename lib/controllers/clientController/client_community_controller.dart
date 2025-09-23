import 'dart:convert';

import 'package:find_me_a_coach/models/clientModel/clinet_comment_model.dart';
import 'package:find_me_a_coach/models/clientModel/community_model.dart';
import 'package:find_me_a_coach/models/coachModel/topic_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class ClientCommunityController extends GetxController{

  var isLoading = false.obs;
  var isCommandLoading = false.obs;
  var isSubmitComment = false.obs;
  final isTopicLoading = false.obs;

  final isPostLoading = false.obs;

  final Rx<TopicModel?> selectedTopic = Rx<TopicModel?>(null);

  RxList<CommunityModel> communityList = <CommunityModel>[].obs;

  RxList<ClientComment> commentList = <ClientComment>[].obs;

  RxList<TopicModel> topicList = <TopicModel>[].obs;

  var id = 0.obs;

  Future<void> fetchCommunityData()async{

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.getAllCommunityEndPoint);

    if(response.statusCode == 200){
      final List<dynamic> list = response.body as List<dynamic>;

      communityList.value =
          list.map((e) => CommunityModel.fromJson(e)).toList();

      if (communityList.isNotEmpty) {
        id.value = communityList.first.id;
      }
    }else{
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isLoading(false);

  }

  Future<void> fetchCommentData()async{

    isCommandLoading(true);

    final response = await ApiClient.getData(ApiConstant.getCommentEndPoint(id: id.value));
    if(response.statusCode == 200 || response.statusCode == 201){
      final Map<String, dynamic> body = response.body as Map<String, dynamic>;

      final List<dynamic> dataList = body['data'] ?? [];
      commentList.value =
          dataList.map((e) => ClientComment.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isCommandLoading(false);

  }

  Future<void> submitComment(String content)async{
    isSubmitComment(true);

    final body = {
      "content": content
    };

    final response = await ApiClient.postData(ApiConstant.addCommentEndPoint(id: id.value), jsonEncode(body));
    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar(response.body['message'], isError: false);
      fetchCommentData();

    }else{
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isSubmitComment(false);

    }

    Future<void> fetchAllTopic()async{

    isTopicLoading(true);

    final response = await ApiClient.getData(ApiConstant.availableTopicsEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      final List<dynamic> dataList = response.body['data'] ?? [];
      topicList.value = dataList.map((e) => TopicModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isTopicLoading(false);

    }

    Future<void> submitPost({required int topic, required String content})async{

    isPostLoading(true);

    final body = {
      "topic": topic,
      "content": content
    };

    final response = await ApiClient.postData(ApiConstant.addTopicEndPoint, jsonEncode(body));

    if(response.statusCode == 200 || response.statusCode == 201){
      showCustomSnackBar("Post created successfully", isError: false);
      fetchCommunityData();
      Get.back();
    }else{
      showCustomSnackBar("Something we want wrong", isError: true);
    }
    isPostLoading(false);

    }



  }

