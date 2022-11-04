
import '../utils/cash_helper.dart';

class SettingsSession {
  static String? _languageCode;
  static String? get languageCode => _languageCode;

  static Future<void> loadLanguage() async {
    await CacheHelper.getInstance()!
        .getString(key: '$languageCode')
        .then((value) {
      if (value == null || value.isEmpty) {
        CacheHelper.getInstance()!
            .saveString(key: '$languageCode',value: 'ar');
        _languageCode = 'ar';
      } else {
        _languageCode = value;
      }
    });
  }
}
