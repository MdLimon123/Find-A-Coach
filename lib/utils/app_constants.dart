import '../models/language_model.dart';

class AppConstants{

  static String APP_NAME="Find Me A Coach";


  // share preference Key
  static String THEME ="theme";

  static const String LANGUAGE_CODE = 'language_code';
  static const String COUNTRY_CODE = 'country_code';

  static RegExp emailValidator = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static RegExp passwordValidator = RegExp(
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"
  );
  // static List<LanguageModel> languages = [
  //   LanguageModel( languageName: 'English', countryCode: 'US', languageCode: 'en'),
  //   LanguageModel( languageName: 'عربى', countryCode: 'SA', languageCode: 'ar'),
  //   LanguageModel( languageName: 'Spanish', countryCode: 'ES', languageCode: 'es'),
  // ];

  static List<LanguageModel> languages = [
    LanguageModel(languageName: "English", languageCode: "en", countryCode: "US"),
    LanguageModel(languageName: "Arabic", languageCode: "ar", countryCode: "SA"),
    LanguageModel(languageName: "Vietnamese", languageCode: "vi", countryCode: "VN"),
    LanguageModel(languageName: "Korean", languageCode: "ko", countryCode: "KR"),
    LanguageModel(languageName: "Hindi", languageCode: "hi", countryCode: "IN"),
    LanguageModel(languageName: "German", languageCode: "de", countryCode: "DE"),
    LanguageModel(languageName: "French", languageCode: "fr", countryCode: "FR"),
    LanguageModel(languageName: "Spanish", languageCode: "es", countryCode: "ES"),
  ];

}