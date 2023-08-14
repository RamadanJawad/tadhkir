import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/function/save_time.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  return await Geolocator.getCurrentPosition();
}

Future<void> getLatAndLong(HomeController controller) async {
  Position position = await determinePosition();
  SharedPrefController()
      .saveCoordinate(long: position.longitude, lat: position.latitude);
  saveData(controller);
}

checkLocation(BuildContext context, HomeController controller) async {
  if (SharedPrefController().latitude == null &&
      SharedPrefController().longitude == null) {
    Future.delayed(const Duration(milliseconds: 500), () {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'ملاحظة',
        desc: "لتحديث أوقات الصلاة , قم بتشغيل خدمة الموقع من الشريط العلوي",
        descTextStyle: getRegularTextStyle(
            fontSize: ManagerFontSize.s16, color: Colors.black),
        titleTextStyle: getRegularTextStyle(
            fontSize: ManagerFontSize.s18, color: ManagerColors.black),
        buttonsTextStyle: getRegularTextStyle(
            fontSize: ManagerFontSize.s16, color: ManagerColors.white),
        btnOkOnPress: () => Get.delete(),
      ).show();
    });
  }
}
