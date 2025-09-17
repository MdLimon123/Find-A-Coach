import 'package:find_me_a_coach/models/clientModel/find_all_coach_model.dart';
import 'package:find_me_a_coach/models/clientModel/find_category_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class FindCoachController extends GetxController{

  var isLoading = false.obs;

  RxList<FindAllCoach> coachList = <FindAllCoach>[].obs;

  RxList<FindCategory> categoryList = <FindCategory>[].obs;


  /// fetch all category

  Future<void> fetchAllCategory()async{

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.getAllCategoryEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      categoryList.assignAll(data.map((e) => FindCategory.fromJson(e)).toList());
    }else{
      showCustomSnackBar (response.body['message']);
    }
    isLoading(false);

  }

/// fetch all coach
  Future<void> fetchAllCoach()async{
    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.getAllCoachEndPoint);

    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];

      coachList.assignAll(data.map((e) => FindAllCoach.fromJson(e)).toList());
    }else{
      showCustomSnackBar (response.body['message']);
    }
    isLoading(false);

  }



}