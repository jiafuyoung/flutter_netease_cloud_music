import 'package:shared_preferences/shared_preferences.dart';

class SongPreferences {
  static const String playing_songs_sp = "playing_songs";
  static const String playing_index = "playing_index";

  Future<void> setSongInfo(String songInfo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(playing_songs_sp, songInfo);
  }

  Future<String?> getSongInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(playing_songs_sp) == null) {
      return "";
    } else {
      return prefs.getString(playing_songs_sp);
    }
  }

  Future<bool> delSongInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove(playing_songs_sp);
  }
}
