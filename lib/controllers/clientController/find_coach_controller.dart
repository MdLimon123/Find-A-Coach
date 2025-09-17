import 'package:find_me_a_coach/models/clientModel/find_all_coach_model.dart';
import 'package:find_me_a_coach/models/clientModel/find_category_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class FindCoachController extends GetxController {
  var isLoading = false.obs;

  RxList<FindAllCoach> coachList = <FindAllCoach>[].obs;
  RxList<FindCategory> categoryList = <FindCategory>[].obs;

  var selected = 0.obs;
  var selectedSlot = 0.obs;

  void selectTime(int value) => selectedSlot.value = value;

  final Map<String, String> filterKeyMap = {
    'lgbtqFriendly': 'lgbtqia_affirming',
    'experienceWithNeurodiversity': 'neurodiversity_affirming',
    'offersSlidingScale': 'faith_based',
    'eveningAvailability': 'trauma_sensitive',
  };

  List<String> languages = ['English', 'Spanish', 'French', 'German'];
  RxList<String> selectedLanguages = <String>[].obs;

  void select(int value) => selected.value = value;

  void toggleLanguage(String language, bool isSelected) {
    if (isSelected) {
      selectedLanguages.add(language);
    } else {
      selectedLanguages.remove(language);
    }
  }

  /// fetch all category
  Future<void> fetchAllCategory() async {
    isLoading(true);
    final response = await ApiClient.getData(ApiConstant.getAllCategoryEndPoint);

    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      categoryList.assignAll(data.map((e) => FindCategory.fromJson(e)).toList());
    } else {
      showCustomSnackBar(response.body['message']);
    }
    isLoading(false);
  }

  /// fetch all coach
  Future<void> fetchAllCoach() async {
    isLoading(true);
    final response = await ApiClient.getData(ApiConstant.getAllCoachEndPoint);

    if (response.statusCode == 200) {
      List<dynamic> data = response.body['data'];
      coachList.assignAll(data.map((e) => FindAllCoach.fromJson(e)).toList());
    } else {
      showCustomSnackBar(response.body['message']);
    }
    isLoading(false);
  }

  /// fetch all coach filter
  Future<void> fetchAllCoachFilter({
    required double minPrice,
    required double maxPrice,
    required Map<String, bool> checkboxValues,
  }) async {
    isLoading(true);

    final params = <String, String>{};

    if (selected.value == 1) {
      params['session_format'] = 'virtual';
    } else if (selected.value == 2) {
      params['session_format'] = 'in_person';
    }

    if (selectedLanguages.isNotEmpty) {
      params['languages_spoken'] = selectedLanguages.join(',').toLowerCase();
    }

    params['min_price'] = minPrice.round().toString();
    params['max_price'] = maxPrice.round().toString();

    checkboxValues.forEach((uiKey, isChecked) {
      final apiKey = filterKeyMap[uiKey];
      if (apiKey != null && isChecked) {
        params[apiKey] = 'true';
      }
    });

    final endPoint =
        '${ApiConstant.getAllCoachEndPoint}?${Uri(queryParameters: params).query}';

    final response = await ApiClient.getData(endPoint);
    if (response.statusCode == 200) {
      final data = response.body['data'] as List;

      coachList.clear();

      coachList.assignAll(data.map((e) => FindAllCoach.fromJson(e)).toList());
    } else {
      showCustomSnackBar(response.body['message']);
    }

    isLoading(false);
  }

  Future<void> fetchSingleCategory({required int id}) async {

    isLoading(true);

    final response = await ApiClient.getData(ApiConstant.singleCategoryEndPoint(id: id));
    if(response.statusCode == 200){
      final data = response.body['data']['coaches'] as List;
      coachList.clear();
      coachList.assignAll(data.map((e) => FindAllCoach.fromJson(e)).toList());
    }else{
      showCustomSnackBar(response.body['message']);
    }
    isLoading(false);

  }

}
