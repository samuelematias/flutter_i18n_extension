import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class StoredSettings {
  static SharedPreferences _prefs;
  bool get isReady => _prefs != null;
  final _controller = StreamController<StoredSettings>.broadcast();
  Stream<StoredSettings> get stream => _controller.stream;

  void dispose() {
    _controller?.close();
  }

  Future<bool> init() async {
    _controller.add(this);
    _prefs = await SharedPreferences.getInstance();
    _controller.add(this);
    return isReady;
  }

  static const String _isFreshKey = 'is_fresh_app_install';
  bool get isFresh => _prefs?.getBool(_isFreshKey) ?? true;
  set isFresh(bool value) => updateIsFresh(value);
  Future updateIsFresh(bool value) async {
    if (!isReady) await init();
    await _prefs.setBool(_isFreshKey, value);
    _controller.add(this);
  }

  static const String _localeKey = 'locale_key';
  String get localeKey => _prefs?.getString(_localeKey) ?? 'en_us';
  static String getLocaleKey() => _prefs?.getString(_localeKey) ?? 'en_us';
  set localeKey(String value) => updateLocaleKey(value);
  Future updateLocaleKey(String value) async {
    if (!isReady) await init();
    await _prefs.setString(_localeKey, value);
    _controller.add(this);
  }
}
