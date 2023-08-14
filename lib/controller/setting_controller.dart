import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/screen/home_screen.dart';

class SettingController extends GetxController {
  final languageController = TextEditingController();
  HomeController homeController = Get.put(HomeController());
  List<String> item = ["arabic".tr, "english".tr];
  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool value4 = false;
  bool value5 = false;
  bool value6 = false;
  bool value7 = false;

  onChangeLanguage(select) {
    languageController.text = select;
    if (languageController.text == "arabic".tr) {
      Get.updateLocale(const Locale("ar"));
      SharedPrefController().saveLanguage("ar");
      HijriCalendar.setLocal("ar");
      Get.offAll(() => const HomeScreen(), transition: Transition.fade);
      update();
    } else if (languageController.text == "english".tr) {
      Get.updateLocale(const Locale("en"));
      SharedPrefController().saveLanguage("en");
      HijriCalendar.setLocal("en");
      Get.offAll(() => const HomeScreen(), transition: Transition.fade);
      update();
    }
    update();
  }

  getData() {
    if (SharedPrefController().status(key: "value1") != null) {
      value1 = SharedPrefController().status(key: "value1")!;
    }
    if (SharedPrefController().status(key: "value2") != null) {
      value2 = SharedPrefController().status(key: "value2")!;
    }
    if (SharedPrefController().status(key: "value3") != null) {
      value3 = SharedPrefController().status(key: "value3")!;
    }
    if (SharedPrefController().status(key: "value4") != null) {
      value4 = SharedPrefController().status(key: "value4")!;
    }
    if (SharedPrefController().status(key: "value5") != null) {
      value5 = SharedPrefController().status(key: "value5")!;
    }
    if (SharedPrefController().status(key: "value6") != null) {
      value6 = SharedPrefController().status(key: "value6")!;
    }
    if (SharedPrefController().status(key: "value7") != null) {
      value7 = SharedPrefController().status(key: "value7")!;
    }
  }

  onChange1(bool val) {
    value1 = val;
    update();
  }

  onChange2(bool val) {
    value2 = val;
    update();
  }

  onChange3(bool val) {
    value3 = val;
    update();
  }

  onChange4(bool val) {
    value4 = val;
    update();
  }

  onChange5(bool val) {
    value5 = val;
    update();
  }

  onChange6(bool val) {
    value6 = val;
    update();
  }

  onChange7(bool val) {
    value7 = val;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
