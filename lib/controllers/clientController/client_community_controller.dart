import 'package:find_me_a_coach/models/clientModel/community_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class ClientCommunityController extends GetxController{

  var isLoading = false.obs;

  RxList<CommunityModel> communityList = <CommunityModel>[].obs;

  Future<void> fetchCommunityData()async{

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.getAllCommunityEndPoint);

    if(response.statusCode == 200){

      communityList.value = (response.body as List).map((e) => CommunityModel.fromJson(e)).toList();
    }else{
      showCustomSnackBar(response.body['message'], isError: false);
    }
    isLoading(false);

  }

}