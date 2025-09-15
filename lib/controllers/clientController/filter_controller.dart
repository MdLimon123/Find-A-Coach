import 'package:get/get.dart';

class FilterController extends GetxController{

  // List of languages to choose from
  List<String> languages = ['English', 'Spanish', 'French', 'German'];

  RxList<String> selectedLanguages = <String>[].obs;


  void toggleLanguage(String language, bool isSelected) {
    if (isSelected) {
      selectedLanguages.add(language);
    } else {
      selectedLanguages.remove(language);
    }
  }

}