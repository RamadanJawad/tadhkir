import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/setting_controller.dart';
import 'package:tadhkir/core/function/notification.dart';
import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/core/resources/manager_assets.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/widget/swtich_button.dart';

class BodyLanguage extends StatelessWidget {
  const BodyLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(builder: (controller) {
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: ManagerHeight.h10,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w6, vertical: ManagerHeight.h6),
              margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
              height: ManagerHeight.h100,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ManagerAssets.language,
                        width: ManagerWidth.w25,
                        height: ManagerHeight.h24,
                      ),
                      SizedBox(
                        width: ManagerWidth.w4,
                      ),
                      Text(
                        "settingLanguage".tr,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18, color: Colors.green),
                      )
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        "selectLang".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      Expanded(
                        child: SizedBox(
                          child: CustomDropdown(
                            fillColor: Colors.white,
                            borderSide: BorderSide(color: Colors.grey.shade100),
                            hintText: "language".tr,
                            listItemStyle: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: Colors.black),
                            selectedStyle: getMediumTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: Colors.lightGreen),
                            items: controller.item,
                            hintStyle: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: Colors.grey),
                            controller: controller.languageController,
                            borderRadius:
                                BorderRadius.circular(ManagerRadius.r10),
                            onChanged: (select) {
                              controller.onChangeLanguage(select);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w6, vertical: ManagerHeight.h6),
              margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
              height: ManagerHeight.h240,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ManagerAssets.adhan,
                        width: ManagerWidth.w25,
                        height: ManagerHeight.h24,
                      ),
                      SizedBox(
                        width: ManagerWidth.w4,
                      ),
                      Text(
                        "notificationPrayTime".tr,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18, color: Colors.green),
                      )
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationFajr".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange1(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value1, key: "value1");
                            if (SharedPrefController().status(key: "value1") ==
                                true) {
                              notificationFajr(
                                  controller
                                      .homeController.prayerTimes.fajr.hour,
                                  controller
                                      .homeController.prayerTimes.fajr.minute);
                            } else {
                              AwesomeNotifications().cancelSchedule(1);
                            }
                          },
                          value: controller.value1)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationDuhr".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange2(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value2, key: "value2");
                            if (SharedPrefController().status(key: "value2") ==
                                true) {
                              notificationDhuhr(
                                  controller
                                      .homeController.prayerTimes.dhuhr.hour,
                                  controller
                                      .homeController.prayerTimes.dhuhr.minute);
                            } else {
                              AwesomeNotifications().cancelSchedule(2);
                            }
                          },
                          value: controller.value2)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationAsr".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange3(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value3, key: "value3");
                            if (SharedPrefController().status(key: "value3") ==
                                true) {
                              notificationAsr(
                                  controller
                                      .homeController.prayerTimes.asr.hour,
                                  controller
                                      .homeController.prayerTimes.asr.minute);
                            } else {
                              AwesomeNotifications().cancelSchedule(3);
                            }
                          },
                          value: controller.value3)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationMagr".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange4(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value4, key: "value4");
                            if (SharedPrefController().status(key: "value4") ==
                                true) {
                              notificationMaghrib(
                                  controller
                                      .homeController.prayerTimes.maghrib.hour,
                                  controller.homeController.prayerTimes.maghrib
                                      .minute);
                            } else {
                              AwesomeNotifications().cancelSchedule(4);
                            }
                          },
                          value: controller.value4)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationIsha".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange5(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value5, key: "value5");
                            if (SharedPrefController().status(key: "value5") ==
                                true) {
                              notificationIsha(
                                  controller
                                      .homeController.prayerTimes.isha.hour,
                                  controller
                                      .homeController.prayerTimes.isha.minute);
                            } else {
                              AwesomeNotifications().cancelSchedule(5);
                            }
                          },
                          value: controller.value5)
                    ],
                  ),
                ],
              ),
            ),
            
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w6, vertical: ManagerHeight.h6),
              margin: EdgeInsets.symmetric(
                  horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
              height: ManagerHeight.h140,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ManagerAssets.notification,
                        width: ManagerWidth.w25,
                        height: ManagerHeight.h24,
                      ),
                      SizedBox(
                        width: ManagerWidth.w4,
                      ),
                      Text(
                        "settingAdkar".tr,
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s18, color: Colors.green),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationMorning".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange6(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value6, key: "value6");
                            if (SharedPrefController().status(key: "value6") ==
                                true) {
                              NotificationManager.displayAdkarNotification(
                                  title: "أذكار الصباح",
                                  description:
                                      "لا تنسى قراءة أذكار الصباح فهي حصنك المنيع",
                                  id: 6,
                                  hour: 6,
                                  minute: 00);
                            } else {
                              AwesomeNotifications().cancelSchedule(6);
                            }
                          },
                          value: controller.value6)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "notificationEvening".tr,
                        style: getMediumTextStyle(
                            fontSize: ManagerFontSize.s16,
                            color: ManagerColors.black),
                      ),
                      SizedBox(
                        width: ManagerWidth.w10,
                      ),
                      SwitchButton(
                          onChangeMethod: (val) {
                            controller.onChange7(val);
                            SharedPrefController().saveStatus(
                                status1: controller.value7, key: "value7");
                            if (SharedPrefController().status(key: "value7") ==
                                true) {
                              NotificationManager.displayAdkarNotification(
                                  title: "أذكار المساء",
                                  description:
                                      "لا تنسى قراءة أذكار المساء فهي حصنك المنيع",
                                  id: 7,
                                  hour: 19,
                                  minute: 05);
                            } else {
                              AwesomeNotifications().cancelSchedule(7);
                            }
                          },
                          value: controller.value7)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
