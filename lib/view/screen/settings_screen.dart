import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/setting_controller.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/widget/body_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Directionality(
      textDirection: SharedPrefController().language == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'setting'.tr,
            style: getMediumTextStyle(
                fontSize: ManagerFontSize.s18, color: Colors.white),
          ),
        ),
        body: const BodyLanguage(),
      ),
    );
  }
}
