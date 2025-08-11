import 'package:get/get.dart';

class LanguageController extends GetxController{

  var isExpanded = false.obs;
  var selectedLanguage = 'English'.obs;
  var searchQuery = ''.obs;

  List<String> languages = [
    'English',
    'Arabic',
    'Spanish',
    'French',
    'German',
    'Hindi',
    'Korean',
    'Vietnamese'
  ];

  List<String> get filteredLanguages {
    if (searchQuery.value.isEmpty) return languages;
    return languages
        .where((lang) =>
        lang.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void selectLanguage(String lang) {
    selectedLanguage.value = lang;
  }

}