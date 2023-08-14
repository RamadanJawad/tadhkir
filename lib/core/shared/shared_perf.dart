import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefController {
  SharedPrefController._();

  static SharedPrefController? _instance;
  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveLanguage(String langCode) async {
    await _sharedPreferences.setString("lang", langCode);
  }

  String get language => _sharedPreferences.getString("lang") ?? '';

  Future<void> saveCoordinate(
      {required double long, required double lat}) async {
    await _sharedPreferences.setDouble("long", long);
    await _sharedPreferences.setDouble("lat", lat);
  }

  Future<void> saveSound({required String path}) async {
    await _sharedPreferences.setString("sound", path);
  }

  String? get sound {
    return _sharedPreferences.getString("sound");
  }

  double? get longitude {
    return _sharedPreferences.getDouble("long");
  }

  double? get latitude {
    return _sharedPreferences.getDouble("lat");
  }

  Future<void> saveStatus({required bool status1, required String key}) async {
    await _sharedPreferences.setBool(key, status1);
  }

  bool? status({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  Future<void> fajr(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour1", hour);
    await _sharedPreferences.setInt("minute1", minute);
    await _sharedPreferences.setString("fajr", prayTime);
  }

  Future<void> shrouq({required String prayTime}) async {
    await _sharedPreferences.setString("shrouq", prayTime);
  }

  Future<void> dhur(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour2", hour);
    await _sharedPreferences.setInt("minute2", minute);
    await _sharedPreferences.setString("dhur", prayTime);
  }

  Future<void> asr(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour3", hour);
    await _sharedPreferences.setInt("minute3", minute);
    await _sharedPreferences.setString("asr", prayTime);
  }

  Future<void> magrab(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour4", hour);
    await _sharedPreferences.setInt("minute4", minute);
    await _sharedPreferences.setString("magrab", prayTime);
  }

  Future<void> isha(
      {required int hour,
      required int minute,
      required String prayTime}) async {
    await _sharedPreferences.setInt("hour5", hour);
    await _sharedPreferences.setInt("minute5", minute);
    await _sharedPreferences.setString("isha", prayTime);
  }

  int? get fajrHour {
    return _sharedPreferences.getInt("hour1");
  }

  int? get fajrMinute {
    return _sharedPreferences.getInt("minute1");
  }

  int? get dhurHour {
    return _sharedPreferences.getInt("hour2");
  }

  int? get dhurMinute {
    return _sharedPreferences.getInt("minute2");
  }

  int? get asrHour {
    return _sharedPreferences.getInt("hour3");
  }

  int? get asrMinute {
    return _sharedPreferences.getInt("minute3");
  }

  int? get magrabHour {
    return _sharedPreferences.getInt("hour4");
  }

  int? get magrabMinute {
    return _sharedPreferences.getInt("minute4");
  }

  int? get ishaHour {
    return _sharedPreferences.getInt("hour5");
  }

  int? get ishaMinute {
    return _sharedPreferences.getInt("minute5");
  }

  String? get prayFajr {
    return _sharedPreferences.getString("fajr");
  }

  String? get prayDhar {
    return _sharedPreferences.getString("dhur");
  }

  String? get prayAsr {
    return _sharedPreferences.getString("asr");
  }

  String? get prayMagrib {
    return _sharedPreferences.getString("magrab");
  }

  String? get prayIsha {
    return _sharedPreferences.getString("isha");
  }

  String? get prayShrouq {
    return _sharedPreferences.getString("shrouq");
  }
}
