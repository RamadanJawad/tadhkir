import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/edit_card_controller.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/widget/body_edit_card.dart';

class EditCardScreen extends StatelessWidget {
  const EditCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditCardController());
    return Directionality(
      textDirection: SharedPrefController().language == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.lightGreen),
          elevation: 0,
          title: Text(
            "editCard".tr,
            style: getMediumTextStyle(
                fontSize: ManagerFontSize.s18, color: Colors.lightGreen),
          ),
        ),
        body: const BodyEditCard(),
      ),
    );
  }
}
