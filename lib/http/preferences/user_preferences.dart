import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/time_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String userInfoKey = "userInfo"; // 用于保存用户信息的键值对
  static const String isLoggedInKey = "isLoggedIn"; // 用于保存登录状态的布尔值
  static const String lastLogin = "lastLogin";
  static const String COOKIES = "cookies";

  Future<void> setUserInfo(String personInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(lastLogin, nowSeconds());
    logI("持久化信息--------------" + personInfo);
    await prefs.setString(userInfoKey, personInfo);
  }

  Future<void> setCookies(String cookies) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(COOKIES, cookies);
  }

  Future<String?> getCookies() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(COOKIES) == null) {
      return "";
    } else {
      return prefs.getString(COOKIES);
    }
  }

  Future<double?> getLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    double dateTime = nowSeconds();
    if (prefs.getDouble(lastLogin) == null) {
      return dateTime;
    } else {
      return prefs.getDouble(lastLogin);
    }
  }

  Future<String?> getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(userInfoKey) == null) {
      return "";
    } else {
      return prefs.getString(userInfoKey);
    }
  }

  Future<bool> setIsLoggedIn(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(isLoggedInKey, value);
  }

  Future<bool?> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool(isLoggedInKey) == null) {
      return false;
    } else {
      return prefs.getBool(isLoggedInKey);
    }
  }

  Future<bool?> deleteUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setCookies("");
    return prefs.remove(userInfoKey).then((value) => setIsLoggedIn(false));
  }
}
