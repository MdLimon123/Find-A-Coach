import 'dart:async';

import 'package:find_me_a_coach/models/clientModel/search_model.dart';
import 'package:find_me_a_coach/services/api_client.dart';
import 'package:find_me_a_coach/services/api_constant.dart';
import 'package:find_me_a_coach/views/base/custom_snackbar.dart';
import 'package:get/get.dart';

class ClientSearchController extends GetxController{

   final isSearchLoading = false.obs;
   
   RxList<CoachData> searchCoachList = <CoachData>[].obs;

   Timer? _debounce;
   
   
   Future<void> fetchSearch(String query) async {
     
     isSearchLoading(true);
     
     final response = await ApiClient.getData("${ApiConstant.searchCoachEndPoint}?q=$query");
     if(response.statusCode == 200){

       searchCoachList.value = (response.body['data'] as List).map((e) => CoachData.fromJson(e)).toList();
     }else{
       showCustomSnackBar("Something went wrong", isError: true);
     }
     isSearchLoading(false);
     
     
   }

   void onSearchChanged(String query) {

     if (_debounce?.isActive ?? false) _debounce!.cancel();


     _debounce = Timer(const Duration(milliseconds: 400), () {
       if (query.trim().isNotEmpty) {
         fetchSearch(query.trim());
       } else {

         searchCoachList.clear();
       }
     });
   }

   @override
   void onClose() {
     _debounce?.cancel();
     super.onClose();
   }

}