import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';

Widget showPopMenu({void Function(int)? onSelected}) {
  return PopupMenuButton<int>(
      onSelected: onSelected,
      elevation: 1,
      padding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ManagerRadius.r10)),
      itemBuilder: (context) => [
            PopupMenuItem<int>(
              value: 0,
              child: Row(
                children: [
                  const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: ManagerWidth.w6,
                  ),
                  Text(
                    "delete".tr,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16, color: Colors.black),
                  ),
                ],
              ),
            ),
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                children: [
                  const Icon(
                    Icons.edit,
                    color: Colors.lightGreen,
                  ),
                  SizedBox(
                    width: ManagerWidth.w6,
                  ),
                  Text(
                    "update".tr,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16, color: Colors.black),
                  ),
                ],
              ),
            ),
          ]);
}
