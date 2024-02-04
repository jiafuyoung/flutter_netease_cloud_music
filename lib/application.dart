// ignore_for_file: file_names

import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double statusBarHeight = 30;
  static double bottomBarHeight = 0;

  static SharedPreferences sp =
      SharedPreferences.getInstance() as SharedPreferences;
}
