import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/allCard_controller.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/screen/card_screen.dart';
import 'package:tadhkir/view/screen/home_screen.dart';
import 'package:tadhkir/view/widget/body_allCard.dart';

class ShowCard extends StatelessWidget {
  const ShowCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllCardController());
    return Directionality(
      textDirection: SharedPrefController().language == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: WillPopScope(
        onWillPop: () async {
          Get.off(() => const HomeScreen(), transition: Transition.fade);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                onPressed: () {
                  Get.off(() => const HomeScreen(),
                      transition: Transition.fade);
                  Get.delete<AllCardController>();
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            iconTheme: const IconThemeData(color: Colors.lightGreen),
            title: Text(
              "reportsCard".tr,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s18, color: Colors.lightGreen),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (controller.card.length != 30) {
                      Get.to(() => const CardScreen(),
                          transition: Transition.fade);
                      Get.delete<AllCardController>();
                    } else {
                      Get.snackbar("", "",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(10),
                          titleText: Text(
                            "خطأ في عملية الاضافة",
                            textDirection: TextDirection.rtl,
                            style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s15,
                                color: ManagerColors.white),
                          ),
                          messageText: Text(
                            "لا يمكنك الاضافة , لقد تجاوزت الحد الأقصى",
                            textDirection: TextDirection.rtl,
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s15,
                                color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.error,
                            color: Colors.white,
                          ));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(ManagerRadius.r10),
                      ),
                      backgroundColor: Colors.lightGreen,
                      side: const BorderSide(color: Colors.lightGreen),
                      foregroundColor: Colors.white),
                  icon: const Icon(Icons.add),
                  label: Text(
                    "addCard".tr,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.white),
                  ),
                ),
              )
            ],
          ),
          body: const BodyAllCard(),
        ),
      ),
    );
  }
}
