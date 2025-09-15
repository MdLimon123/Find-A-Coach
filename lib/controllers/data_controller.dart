
import 'package:find_me_a_coach/utils/common_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
class DataController extends GetxController{

  var id = 0.obs;
  var name = "".obs;
  var profileImage="".obs;
  var email = "".obs;
  var phone = "".obs;
  var role = "".obs;
  var childImage = "".obs;
  var childName = "".obs;
  var childDb = "".obs;

  var updateLocation = "".obs;


  late SharedPreferences preferences;



  getData() async {
    preferences = await SharedPreferences.getInstance();


    id.value = preferences.getInt(CommonData.id) ?? 0;
    email.value = preferences.getString(CommonData.email) ?? "";
    name.value = preferences.getString(CommonData.name) ?? "";
    profileImage.value=  preferences.getString(CommonData.profileImage)??"";
    phone.value = preferences.getString(CommonData.phone) ?? "";
  }


  getChildData()async{
    preferences = await SharedPreferences.getInstance();
    childImage.value = preferences.getString(CommonData.childImage)?? "";
    childName.value = preferences.getString(CommonData.childName) ?? "";
    childDb.value = preferences.getString(CommonData.childDob) ?? "";
  }

  getLocationData()async{
    preferences = await SharedPreferences.getInstance();
    updateLocation.value = preferences.getString(CommonData.updateLocation)?? "";
  }


  getProfileData() async {
    preferences = await SharedPreferences.getInstance();
    id.value = preferences.getInt(CommonData.id) ?? 0;
    email.value = preferences.getString(CommonData.email) ?? "";
    name.value = preferences.getString(CommonData.name) ?? "";
    profileImage.value=  preferences.getString(CommonData.profileImage)??"";
  }



  setUpdateLocation(String updateLocationD)async{

    updateLocation.value = updateLocationD;

    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.updateLocation, updateLocationD);

  }

  setProfileData({
    required String emailD,
    required String nameD,
    required String profileImageD,
  }) async {
    email.value = emailD;
    name.value = nameD;

    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.email, emailD);
    preferences.setString(CommonData.name, nameD);
    preferences.setString(CommonData.profileImage, profileImageD);
  }

  setChildData(
      {
        required String childImageD,
        required String childNameD,
        required String childDbD,
      }
      )async{

    childImage.value = childImageD;
    childName.value = childNameD;
    childDb.value = childDbD;

    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.childImage, childImageD);
    preferences.setString(CommonData.childName, childNameD);
    preferences.setString(CommonData.childDob, childDbD);

  }



  /// Set Data Form Hold Data
  setData({
    required int idD,
    required String emailD,
    required String nameD,
    required String phoneD,
    required String profileImageD

  }) async {
    id.value = idD;
    email.value = emailD;
    name.value = nameD;
    phone.value = phoneD;
    profileImage.value=profileImageD;
    preferences = await SharedPreferences.getInstance();
    preferences.setInt(CommonData.id, idD);
    preferences.setString(CommonData.email, emailD);
    preferences.setString(CommonData.name, nameD);
    preferences.setString(CommonData.phone, phoneD);
    preferences.setString(CommonData.profileImage, profileImageD);
  }



  updateProfileImage(String profileImageD)async{
    preferences = await SharedPreferences.getInstance();
    profileImage.value=profileImageD;
    preferences.setString(CommonData.profileImage, profileImageD);

  }

}