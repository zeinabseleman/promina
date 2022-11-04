
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static CacheHelper? instance;

   saveString(
      {required String key, required String value}) async {
    var prefs = await _prefs;
    await prefs.setString(key, value);
  }


   remove({required String key}) async {
    var prefs = await _prefs;
    prefs.remove(key);
  }

   getString({required String key}) async {
    var prefs = await _prefs;
    if (prefs.containsKey(key)) return prefs.getString(key);
    return "";
  }


  static CacheHelper? getInstance() {
    instance ??= CacheHelper();

    return instance;
  }



}
