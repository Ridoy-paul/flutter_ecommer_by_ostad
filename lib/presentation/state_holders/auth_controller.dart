import 'dart:convert';
import '../../data/models/user_profile_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  String? token;
  UserProfileModel? userProfileModel;

  Future<void> saveAuthUserDetails(UserProfileModel profile) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('profile', jsonEncode(profile.toJson()));
    userProfileModel = profile;
  }

  Future<void> saveAuthToken(String t) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', t);
    token = t;
    update();
  }

  Future<void> updateUserInformation(UserProfileModel model) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('profile', jsonEncode(model.toJson()));
    userProfileModel = model;
    update();
  }

  Future<void> initialize() async {
    token = await _getToken();
    userProfileModel = await _getProfile();
  }

  Future<String?> _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('token');
  }

  Future<UserProfileModel?> _getProfile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userProfile = sharedPreferences.getString('profile');
    if(userProfile == null) {
      return null;
    }
    else {
      return UserProfileModel.fromJson(jsonDecode(userProfile));
    }
  }


  Future<bool> isLoggedIn() async {
    await initialize();
    return token != null;
  }

  Future<void> clearAuthData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }



}