import 'package:flutter/material.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';

Widget customTitle(String title) {
  return Text(
    title,
    style: getBoldTextStyle(fontSize: ManagerFontSize.s14, color: Colors.black),
  );
}
