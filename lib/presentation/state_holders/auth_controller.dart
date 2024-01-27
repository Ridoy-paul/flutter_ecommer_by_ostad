import 'dart:convert';
import '../../data/models/user_profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? token;
  UserProfileModel? userProfileModel;


  Future<void> saveAuthToken(String t) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    token = t;
    update();
  }


  Future<void> saveUserProfileInformation(UserProfileModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userInfo', jsonEncode(model.toJson()));
    userProfileModel = model;
    update();
  }

  Future<void> updateUserInformation(UserProfileModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userInfo', jsonEncode(model.toJson()));
    userProfileModel = model;
    update();
  }

  Future<void> initializeUserCache() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
    // userProfileModel = UserProfileModel.fromJson(jsonDecode(sharedPreferences.getString('userInfo') ?? '{}'));
    update();
  }

  Future<bool> checkAuthState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');
    if(token != null) {
      await initializeUserCache();
      return true;
    }
    return false;
  }



}