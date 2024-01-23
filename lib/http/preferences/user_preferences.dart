import 'package:netease_cloud_music_flutter/utils/log_utils.dart';
import 'package:netease_cloud_music_flutter/utils/time_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static const String userInfoKey = "userInfo"; // 用于保存用户信息的键值对
  static const String isLoggedInKey = "isLoggedIn"; // 用于保存登录状态的布尔值
  static const String lastLogin = "lastLogin";

  Future<void> setUserInfo(String personInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    double dateTime = nowSeconds();
    logI("设置用户信息，同时设置登录时间----" + dateTime.toString());
    prefs.setDouble(lastLogin, dateTime);
    await prefs.setString(userInfoKey, personInfo);
  }

  Future<double?> getLastLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    double dateTime = nowSeconds();
    if (prefs.getDouble(lastLogin) == null) {
      logI("无上次登录时间戳---" + dateTime.toString());
      return dateTime;
    } else {
      logI("上次登录时间戳" + prefs.getDouble(lastLogin).toString());
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
    logI("修改登录状态");
    return prefs.setBool(isLoggedInKey, value);
  }

  Future<bool?> getIsLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    logI("是否登录");
    if (prefs.getBool(isLoggedInKey) == null) {
      logI("值为空");
      return false;
    } else {
      logI("值不为空" + prefs.getBool(isLoggedInKey).toString());
      return prefs.getBool(isLoggedInKey);
    }
  }

  Future<bool?> deleteUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(userInfoKey).then((value) => setIsLoggedIn(false));
  }
}
