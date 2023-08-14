import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/caledner_controller.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/screen/event_screen.dart';
import 'package:tadhkir/view/screen/home_screen.dart';
import 'package:tadhkir/view/widget/body_calender.dart';

class CalenderScreen extends StatelessWidget {
  const CalenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CalendersController());
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
                },
                icon: const Icon(Icons.arrow_back_rounded)),
            iconTheme: const IconThemeData(color: Colors.lightGreen),
            title: Text(
              'events'.tr,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16, color: Colors.lightGreen),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (controller.events.length != 20) {
                      Get.to(() => const EventScreen(),
                          transition: Transition.fade);
                      Get.delete<CalendersController>();
                    } else {
                      Get.snackbar("", "",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(10),
                          titleText: Text(
                            "errorOfAdd".tr,
                            textDirection: TextDirection.rtl,
                            style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s15,
                                color: ManagerColors.white),
                          ),
                          messageText: Text(
                            "maximum".tr,
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
                    "addEvent".tr,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s14,
                        color: ManagerColors.white),
                  ),
                ),
              )
            ],
          ),
          body: const BodyCalender(),
        ),
      ),
    );
  }
}
