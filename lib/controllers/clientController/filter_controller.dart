import 'package:get/get.dart';

class FilterController extends GetxController{

  // List of languages to choose from
  List<String> languages = ['English', 'Spanish', 'French', 'German'];

  // List to hold the selected languages
  RxList<String> selectedLanguages = <String>[].obs;

  // Toggle selection of a language
  void toggleLanguage(String language, bool isSelected) {
    if (isSelected) {
      selectedLanguages.add(language);
    } else {
      selectedLanguages.remove(language);
    }
  }

}