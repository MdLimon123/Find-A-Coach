
import 'dart:convert';

import 'package:find_me_a_coach/utils/common_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataController extends GetxController{

  /// user observable variables
  var id = 0.obs;
  var application = "".obs;
  var role = "".obs;
  var name = "".obs;
  var email = "".obs;
  var profileImage = "".obs;
  var googleImageUrl = "".obs;
  var facebookId = "".obs;
  var facebookImageUrl = "".obs;
  var age = 0.obs;
  var location = "".obs;
  var bio = "".obs;
  var ethnicity = "".obs;
  var gender = "".obs;
  var sexualOrientation = "".obs;
  var neurotypes = <String>[].obs;
  var profession = "".obs;
  var socialMediaLink = "".obs;
  var interestsAndProjects = "".obs;
  var anythingElse = "".obs;
  var isSubscribed = false.obs;
  var subscriptionType = "".obs;
  var subscriptionStart = "".obs;
  var subscriptionEnd = "".obs;
  var dateJoined = "".obs;
  var lastLogin = "".obs;

  late SharedPreferences _prefs;


  /// Coach-specific data
  var coachId = 0.obs;
  var coachApplication = "".obs;
  var coachRole = "".obs;
  var fullName = "".obs;
  var coachEmail = "".obs;
  var coachProfileImage = "".obs;
  var coachGoogleImageUrl = "".obs;
  var coachFacebookId = "".obs;
  var coachFacebookImageUrl = "".obs;
  var coachAge = 0.obs;
  var coachLocation = "".obs;
  var coachBio = "".obs;
  var coachGender = "".obs;
  var certifications = <String>[].obs;
  var languagesSpoken = <String>[].obs;
  var personalWebsite = "".obs;
  var linkedinProfile = "".obs;
  var coachingAreas = <int>[].obs;
  var coachingAreaNames = <String>[].obs;
  var subCoachingAreas = <int>[].obs;
  var subCoachingAreaNames = <String>[].obs;
  var sessionFormat = "".obs;
  var availability = <String, List<Map<String, String>>>{}.obs;
  var pricePerSession = 0.0.obs;
  var neurodiversityAffirming = false.obs;
  var lgbtqiaAffirming = false.obs;
  var genderSensitive = false.obs;
  var traumaSensitive = false.obs;
  var faithBased = false.obs;
  var coachDateJoined = "".obs;
  var coachLastLogin = "".obs;



  /// -------- USER SET --------------
  Future<void> setUserData(Map<String, dynamic> d) async {
    _prefs = await SharedPreferences.getInstance();

    id.value               = d['user_id'] ?? 0;
    application.value      = d['application'] ?? "";
    role.value             = d['role'] ?? "";
    name.value             = d['full_name'] ?? "";
    email.value            = d['email'] ?? "";
    profileImage.value     = d['image'] ?? "";
    googleImageUrl.value   = d['google_image_url'] ?? "";
    facebookId.value       = d['facebook_id'] ?? "";
    facebookImageUrl.value = d['facebook_image_url'] ?? "";
    age.value              = d['age'] ?? 0;
    location.value         = d['location'] ?? "";
    bio.value              = d['bio'] ?? "";
    ethnicity.value        = d['ethnicity'] ?? "";
    gender.value           = d['gender'] ?? "";
    sexualOrientation.value= d['sexual_orientation'] ?? "";
    neurotypes.value       = List<String>.from(d['neurotypes'] ?? []);
    profession.value       = d['profession'] ?? "";
    socialMediaLink.value  = d['social_media_link'] ?? "";
    interestsAndProjects.value = d['interests_and_projects'] ?? "";
    anythingElse.value     = d['anything_else'] ?? "";
    isSubscribed.value     = d['is_subscribed'] ?? false;
    subscriptionType.value = d['subscription_type'] ?? "";
    subscriptionStart.value= d['subscription_start'] ?? "";
    subscriptionEnd.value  = d['subscription_end'] ?? "";
    dateJoined.value       = d['date_joined'] ?? "";
    lastLogin.value        = d['last_login'] ?? "";

    /// Save to USER SharedPreferences
    await _prefs.setInt(CommonData.id, id.value);
    await _prefs.setString(CommonData.application, application.value);
    await _prefs.setString(CommonData.role, role.value);
    await _prefs.setString(CommonData.name, name.value);
    await _prefs.setString(CommonData.email, email.value);
    await _prefs.setString(CommonData.profileImage, profileImage.value);
    await _prefs.setString(CommonData.googleImageUrl, googleImageUrl.value);
    await _prefs.setString(CommonData.facebookId, facebookId.value);
    await _prefs.setString(CommonData.facebookImageUrl, facebookImageUrl.value);
    await _prefs.setInt(CommonData.age, age.value);
    await _prefs.setString(CommonData.location, location.value);
    await _prefs.setString(CommonData.bio, bio.value);
    await _prefs.setString(CommonData.ethnicity, ethnicity.value);
    await _prefs.setString(CommonData.gender, gender.value);
    await _prefs.setString(CommonData.sexualOrientation, sexualOrientation.value);
    await _prefs.setStringList(CommonData.neurotypes, neurotypes);
    await _prefs.setString(CommonData.profession, profession.value);
    await _prefs.setString(CommonData.socialMediaLink, socialMediaLink.value);
    await _prefs.setString(CommonData.interestsAndProjects, interestsAndProjects.value);
    await _prefs.setString(CommonData.anythingElse, anythingElse.value);
    await _prefs.setBool(CommonData.isSubscribed, isSubscribed.value);
    await _prefs.setString(CommonData.subscriptionType, subscriptionType.value);
    await _prefs.setString(CommonData.subscriptionStart, subscriptionStart.value);
    await _prefs.setString(CommonData.subscriptionEnd, subscriptionEnd.value);
    await _prefs.setString(CommonData.dateJoined, dateJoined.value);
    await _prefs.setString(CommonData.lastLogin, lastLogin.value);
  }



  /// ----------------- SET COACH DATA -----------------
  Future<void> setCoachData(Map<String, dynamic> d) async {
    _prefs = await SharedPreferences.getInstance();

    // STRINGS
    coachId.value = (d['user_id'] ?? 0) as int;
    coachApplication.value = (d['application'] ?? "") as String;
    coachRole.value = (d['role'] ?? "") as String;
    fullName.value = (d['full_name'] ?? "") as String;
    coachEmail.value = (d['email'] ?? "") as String;
    coachProfileImage.value = (d['image'] ?? "") as String;
    coachGoogleImageUrl.value = (d['google_image_url'] ?? "") as String;
    coachFacebookId.value = (d['facebook_id'] ?? "") as String;
    coachFacebookImageUrl.value = (d['facebook_image_url'] ?? "") as String;
    coachLocation.value = (d['location'] ?? "") as String;
    coachBio.value = (d['bio'] ?? "") as String;
    coachGender.value = (d['gender'] ?? "") as String;
    personalWebsite.value = (d['personal_website'] ?? "") as String;
    linkedinProfile.value = (d['linkedin_profile'] ?? "") as String;
    sessionFormat.value = (d['session_format'] ?? "") as String;
    coachDateJoined.value = (d['date_joined'] ?? "") as String;
    coachLastLogin.value = (d['last_login'] ?? "") as String;

    // NUMBERS
    coachAge.value = (d['age'] ?? 0) as int;
    pricePerSession.value = (d['price_per_session'] ?? 0).toDouble();

    // BOOLEANS
    neurodiversityAffirming.value = (d['neurodiversity_affirming'] ?? false) as bool;
    lgbtqiaAffirming.value = (d['lgbtqia_affirming'] ?? false) as bool;
    genderSensitive.value = (d['gender_sensitive'] ?? false) as bool;
    traumaSensitive.value = (d['trauma_sensitive'] ?? false) as bool;
    faithBased.value = (d['faith_based'] ?? false) as bool;

    // LISTS
    certifications.value = List<String>.from(d['certifications'] ?? []);
    languagesSpoken.value = List<String>.from(d['languages_spoken'] ?? []);
    coachingAreas.value = List<int>.from(d['coaching_areas'] ?? []);
    coachingAreaNames.value = List<String>.from(d['coaching_area_names'] ?? []);
    subCoachingAreas.value = List<int>.from(d['sub_coaching_areas'] ?? []);
    subCoachingAreaNames.value = List<String>.from(d['sub_coaching_area_names'] ?? []);

    // AVAILABILITY (Map<String, List<Map<String, String>>>)
    availability.value = d['availability'] != null
        ? Map<String, List<Map<String, String>>>.from(
      (d['availability'] as Map).map(
            (key, value) => MapEntry(
          key.toString(),
          (value as List)
              .map((e) => Map<String, String>.from(e ?? {}))
              .toList(),
        ),
      ),
    )
        : {};

    // ----------- SAVE TO SHARED PREFERENCES -----------
    await _prefs.setInt(CommonData.coachId, coachId.value);
    await _prefs.setString(CommonData.applicationCoach, coachApplication.value);
    await _prefs.setString(CommonData.roleCoach, coachRole.value);
    await _prefs.setString(CommonData.fullName, fullName.value);
    await _prefs.setString(CommonData.coachEmail, coachEmail.value);
    await _prefs.setString(CommonData.coachProfileImage, coachProfileImage.value);
    await _prefs.setString(CommonData.coachGoogleImageUrl, coachGoogleImageUrl.value);
    await _prefs.setString(CommonData.coachFacebookId, coachFacebookId.value);
    await _prefs.setString(CommonData.coachFacebookImageUrl, coachFacebookImageUrl.value);
    await _prefs.setInt(CommonData.coachAge, coachAge.value);
    await _prefs.setString(CommonData.coachLocation, coachLocation.value);
    await _prefs.setString(CommonData.coachBio, coachBio.value);
    await _prefs.setString(CommonData.coachGender, coachGender.value);
    await _prefs.setStringList(CommonData.certifications, certifications);
    await _prefs.setStringList(CommonData.languagesSpoken, languagesSpoken);
    await _prefs.setString(CommonData.personalWebsite, personalWebsite.value);
    await _prefs.setString(CommonData.linkedinProfile, linkedinProfile.value);
    await _prefs.setStringList(CommonData.coachingAreas, coachingAreas.map((e) => e.toString()).toList());
    await _prefs.setStringList(CommonData.coachingAreaNames, coachingAreaNames);
    await _prefs.setStringList(CommonData.subCoachingAreas, subCoachingAreas.map((e) => e.toString()).toList());
    await _prefs.setStringList(CommonData.subCoachingAreaNames, subCoachingAreaNames);
    await _prefs.setString(CommonData.sessionFormat, sessionFormat.value);
    await _prefs.setString(CommonData.availability, jsonEncode(availability));
    await _prefs.setDouble(CommonData.pricePerSession, pricePerSession.value);
    await _prefs.setBool(CommonData.neurodiversityAffirming, neurodiversityAffirming.value);
    await _prefs.setBool(CommonData.lgbtqiaAffirming, lgbtqiaAffirming.value);
    await _prefs.setBool(CommonData.genderSensitive, genderSensitive.value);
    await _prefs.setBool(CommonData.traumaSensitive, traumaSensitive.value);
    await _prefs.setBool(CommonData.faithBased, faithBased.value);
    await _prefs.setString(CommonData.coachDateJoined, coachDateJoined.value);
    await _prefs.setString(CommonData.coachLastLogin, coachLastLogin.value);
  }


  /// -------- USER GET --------------
  Future<void> getUserData() async {
    _prefs = await SharedPreferences.getInstance();

    id.value               = _prefs.getInt(CommonData.id) ?? 0;
    application.value      = _prefs.getString(CommonData.application) ?? "";
    role.value             = _prefs.getString(CommonData.role) ?? "";
    name.value             = _prefs.getString(CommonData.name) ?? "";
    email.value            = _prefs.getString(CommonData.email) ?? "";
    profileImage.value     = _prefs.getString(CommonData.profileImage) ?? "";
    googleImageUrl.value   = _prefs.getString(CommonData.googleImageUrl) ?? "";
    facebookId.value       = _prefs.getString(CommonData.facebookId) ?? "";
    facebookImageUrl.value = _prefs.getString(CommonData.facebookImageUrl) ?? "";
    age.value              = _prefs.getInt(CommonData.age) ?? 0;
    location.value         = _prefs.getString(CommonData.location) ?? "";
    bio.value              = _prefs.getString(CommonData.bio) ?? "";
    ethnicity.value        = _prefs.getString(CommonData.ethnicity) ?? "";
    gender.value           = _prefs.getString(CommonData.gender) ?? "";
    sexualOrientation.value= _prefs.getString(CommonData.sexualOrientation) ?? "";
    neurotypes.value       = _prefs.getStringList(CommonData.neurotypes) ?? [];
    profession.value       = _prefs.getString(CommonData.profession) ?? "";
    socialMediaLink.value  = _prefs.getString(CommonData.socialMediaLink) ?? "";
    interestsAndProjects.value = _prefs.getString(CommonData.interestsAndProjects) ?? "";
    anythingElse.value     = _prefs.getString(CommonData.anythingElse) ?? "";
    isSubscribed.value     = _prefs.getBool(CommonData.isSubscribed) ?? false;
    subscriptionType.value = _prefs.getString(CommonData.subscriptionType) ?? "";
    subscriptionStart.value= _prefs.getString(CommonData.subscriptionStart) ?? "";
    subscriptionEnd.value  = _prefs.getString(CommonData.subscriptionEnd) ?? "";
    dateJoined.value       = _prefs.getString(CommonData.dateJoined) ?? "";
    lastLogin.value        = _prefs.getString(CommonData.lastLogin) ?? "";
  }


  /// ----------------- GET COACH DATA -----------------
  Future<void> getCoachData() async {
    _prefs = await SharedPreferences.getInstance();

    coachId.value = _prefs.getInt(CommonData.coachId) ?? 0;
    coachApplication.value = _prefs.getString(CommonData.applicationCoach) ?? "";
    coachRole.value = _prefs.getString(CommonData.roleCoach) ?? "";
    fullName.value = _prefs.getString(CommonData.fullName) ?? "";
    coachEmail.value = _prefs.getString(CommonData.coachEmail) ?? "";
    coachProfileImage.value = _prefs.getString(CommonData.coachProfileImage) ?? "";
    coachGoogleImageUrl.value = _prefs.getString(CommonData.coachGoogleImageUrl) ?? "";
    coachFacebookId.value = _prefs.getString(CommonData.coachFacebookId) ?? "";
    coachFacebookImageUrl.value = _prefs.getString(CommonData.coachFacebookImageUrl) ?? "";
    coachAge.value = _prefs.getInt(CommonData.coachAge) ?? 0;
    coachLocation.value = _prefs.getString(CommonData.coachLocation) ?? "";
    coachBio.value = _prefs.getString(CommonData.coachBio) ?? "";
    coachGender.value = _prefs.getString(CommonData.coachGender) ?? "";
    certifications.value = _prefs.getStringList(CommonData.certifications) ?? [];
    languagesSpoken.value = _prefs.getStringList(CommonData.languagesSpoken) ?? [];
    personalWebsite.value = _prefs.getString(CommonData.personalWebsite) ?? "";
    linkedinProfile.value = _prefs.getString(CommonData.linkedinProfile) ?? "";
    coachingAreas.value = (_prefs.getStringList(CommonData.coachingAreas)?.map((e) => int.parse(e)).toList()) ?? [];
    coachingAreaNames.value = _prefs.getStringList(CommonData.coachingAreaNames) ?? [];
    subCoachingAreas.value = (_prefs.getStringList(CommonData.subCoachingAreas)?.map((e) => int.parse(e)).toList()) ?? [];
    subCoachingAreaNames.value = _prefs.getStringList(CommonData.subCoachingAreaNames) ?? [];
    sessionFormat.value = _prefs.getString(CommonData.sessionFormat) ?? "";

    String availString = _prefs.getString(CommonData.availability) ?? "{}";
    availability.value = Map<String, List<Map<String, String>>>.from(
      jsonDecode(availString).map(
            (key, value) => MapEntry(
          key,
          List<Map<String, String>>.from((value as List).map((e) => Map<String, String>.from(e))),
        ),
      ),
    );

    pricePerSession.value = _prefs.getDouble(CommonData.pricePerSession) ?? 0.0;
    neurodiversityAffirming.value = _prefs.getBool(CommonData.neurodiversityAffirming) ?? false;
    lgbtqiaAffirming.value = _prefs.getBool(CommonData.lgbtqiaAffirming) ?? false;
    genderSensitive.value = _prefs.getBool(CommonData.genderSensitive) ?? false;
    traumaSensitive.value = _prefs.getBool(CommonData.traumaSensitive) ?? false;
    faithBased.value = _prefs.getBool(CommonData.faithBased) ?? false;
    coachDateJoined.value = _prefs.getString(CommonData.coachDateJoined) ?? "";
    coachLastLogin.value = _prefs.getString(CommonData.coachLastLogin) ?? "";
  }



  updateProfileImage(String profileImageD)async{
    _prefs = await SharedPreferences.getInstance();
    profileImage.value=profileImageD;
    _prefs.setString(CommonData.profileImage, profileImageD);
  }

}