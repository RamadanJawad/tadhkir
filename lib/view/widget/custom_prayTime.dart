import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';

class CustomPrayTime extends StatelessWidget {
  const CustomPrayTime({
    super.key,
    required this.imagePath,
    required this.prayTimeName,
    required this.prayTime,
  });
  final String imagePath;
  final String prayTimeName;
  final String prayTime;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Column(
        children: [
          Text(
            prayTimeName.tr,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s16, color: Colors.black),
          ),
          SizedBox(
            height: ManagerWidth.w4,
          ),
          Image.asset(
            imagePath,
            width: ManagerWidth.w20,
            height: ManagerHeight.h20,
          ),
          SizedBox(
            height: ManagerWidth.w4,
          ),
          Text(
            prayTime,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s16, color: Colors.black),
          ),
        ],
      );
    });
  }
}
