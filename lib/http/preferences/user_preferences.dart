import 'package:netease_cloud_music_flutter/utils/time_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String loginKey = "loginKey";
  static const String userInfoKey = "userInfo"; // 用于保存用户信息的键值对
  static const String isLoggedInKey = "isLoggedIn"; // 用于保存登录状态的布尔值
  static const String lastLogin = "lastLogin";
  static const String COOKIES = "cookies";
  static const String phoneKey = "phoneKey";
  static const String passwordKey = "passwordKey";

  Future<void> setLogin(String personInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(lastLogin, nowSeconds());
    await prefs.setString(loginKey, personInfo);
  }

  Future<String?> getLgoin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(loginKey) == null) {
      return "";
    } else {
      return prefs.getString(loginKey);
    }
  }

  Future<void> setUserInfoLoginStatus(String personInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userInfoKey, personInfo);
  }

  Future<String?> getUserInfoLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(userInfoKey) == null) {
      return "";
    } else {
      return prefs.getString(userInfoKey);
    }
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

  Future<void> setPhone(String phone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(phoneKey, phoneKey);
  }

  Future<String?> getPhone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(phoneKey) == null) {
      return "";
    } else {
      return prefs.getString(phoneKey);
    }
  }

  Future<void> setPassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(passwordKey, password);
  }

  Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(passwordKey) == null) {
      return "";
    } else {
      return prefs.getString(passwordKey);
    }
  }

  Future<bool?> deleteUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setCookies("");
    prefs.remove(loginKey);
    prefs.remove(userInfoKey);
    setIsLoggedIn(false);
    return true;
  }
}
