import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/setting_controller.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton(
      {super.key, required this.onChangeMethod, required this.value});

  final Function? onChangeMethod;

  final bool value;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return Transform.scale(
        scale: 0.9,
        child: CupertinoSwitch(
          activeColor: Colors.lightGreen,
          value: value,
          onChanged: (val) {
            onChangeMethod!(val);
          },
        ),
      );
    });
  }
}