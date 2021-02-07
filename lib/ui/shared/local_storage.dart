import 'package:shared_preferences/shared_preferences.dart';


class AppPrefs {
  static AppPrefs _gcPrefrence = null;
  static SharedPreferences _prefrence;

  AppPrefs._internal();

  static AppPrefs getInstance() {
    if (_gcPrefrence == null || _prefrence == null) {
      _init();
      _gcPrefrence = AppPrefs._internal();
    }
    return _gcPrefrence;
  }

  static Future _init() async {
    _prefrence = await SharedPreferences.getInstance();
  }

  void saveToDisk<T>(String key, T content){
    print('(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    if(content is String) {
      _prefrence.setString(key, content);
    }
    if(content is bool) {
      _prefrence.setBool(key, content);
    }
    if(content is int) {
      _prefrence.setInt(key, content);
    }
    if(content is double) {
      _prefrence.setDouble(key, content);
    }
    if(content is List<String>) {
      _prefrence.setStringList(key, content);
    }
  }

  dynamic getFromDisk(String key) {
    var value  = _prefrence.get(key);
    print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return value;
  }

  clearPreferences(){
    _prefrence.clear();
  }
}
