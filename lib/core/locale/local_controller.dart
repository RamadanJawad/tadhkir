import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';

class LocalController extends GetxController {
  Locale? language;

  changeLanguage(String langCode) {
    Locale locale = Locale(langCode);
    SharedPrefController().saveLanguage(langCode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();
    if (SharedPrefController().language == "ar") {
      language = const Locale("ar");
      HijriCalendar.setLocal(language.toString());
    } else if (SharedPrefController().language == "en") {
      language = const Locale("en");
      HijriCalendar.setLocal(language.toString());
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      HijriCalendar.setLocal(language.toString());
    }
  }
}
