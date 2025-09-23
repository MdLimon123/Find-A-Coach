import 'package:find_me_a_coach/models/about_us_model.dart';
import 'package:find_me_a_coach/models/coachModel/terms_and_condition_model.dart';
import 'package:find_me_a_coach/models/privacy_police_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class AboutUsController extends GetxController{


  final isLoading = false.obs;

  final isCondition = false.obs;

  final isPrivacy = false.obs;

  RxList<AboutUsModel> aboutUsList = <AboutUsModel>[].obs;
  RxList<TermsAndCondition> termsAndConditionList = <TermsAndCondition>[].obs;
  RxList<PrivacyPolicyModel> privacyPolicyList = <PrivacyPolicyModel>[].obs;

  Future<void> fetchAboutUs()async{

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.aboutUsEndPoint);
    if(response.statusCode == 200 || response.statusCode == 201){
      List<dynamic> data = response.body['data'];
      aboutUsList.value = data.map((item) => AboutUsModel.fromJson(item)).toList();
    }else{
      showCustomSnackBar("Something we want to wrong", isError: true);
    }
    isLoading(false);

  }

  Future<void> fetchTermsAndCondition()async{
    isCondition(true);

    final response = await ApiClient.getData(ApiConstant.termsOfConditionEndPoint);

    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      termsAndConditionList.value = data.map((item) => TermsAndCondition.fromJson(item)).toList();
    }else{
      showCustomSnackBar("Something we want to wrong", isError: true);
    }
    isCondition(false);

  }

  Future<void> fetchPrivacyPolicy()async{
    isPrivacy(true);

    final response = await ApiClient.getData(ApiConstant.privacyPolicyEndPoint);
    if(response.statusCode == 200){
      List<dynamic> data = response.body['data'];
      privacyPolicyList.value = data.map((item) => PrivacyPolicyModel.fromJson(item)).toList();
    }else{
      showCustomSnackBar("Something we want to wrong", isError: true);
    }
    isPrivacy(false);


  }

}