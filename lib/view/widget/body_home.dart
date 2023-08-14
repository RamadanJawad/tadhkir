import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/data/day.dart';
import 'package:tadhkir/core/data/month.dart';
import 'package:tadhkir/core/function/check_time.dart';
import 'package:tadhkir/core/function/location.dart';
import 'package:tadhkir/core/locale/local_controller.dart';
import 'package:tadhkir/core/resources/manager_assets.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/screen/calender_screen.dart';
import 'package:tadhkir/view/screen/card_screen.dart';
import 'package:tadhkir/view/screen/settings_screen.dart';
import 'package:tadhkir/view/screen/show_card.dart';
import 'package:tadhkir/view/widget/custom_prayTime.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      check(controller);
      return SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            height: ManagerHeight.h140,
            padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w12),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(ManagerRadius.r30),
                bottomRight: Radius.circular(ManagerRadius.r30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ManagerHeight.h10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () async {
                        Get.to(() => const SettingScreen(),
                            transition: Transition.fade);
                        Get.delete<HomeController>();
                      },
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        if (SharedPrefController().latitude == null &&
                            SharedPrefController().longitude == null) {
                          await getLatAndLong(controller);
                          await controller.initPryTime();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("messageSuccess".tr,
                                  textAlign: TextAlign.center,
                                  style: getMediumTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: Colors.white)),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.grey.shade500,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        }
                      },
                      icon: const Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "stayPray".tr,
                      style: getMediumTextStyle(
                          fontSize: ManagerFontSize.s20, color: Colors.white),
                    ),
                    Text(" ${controller.currentPray}",
                        style: getRegularTextStyle(
                            fontSize: ManagerFontSize.s20,
                            color: Colors.white)),
                  ],
                ),
                StreamBuilder(
                  stream: Stream.periodic(const Duration(seconds: 1)),
                  builder: (context, snapshot) {
                    return Center(
                      child: Text(
                        controller.dateTime
                            .difference(DateTime.now())
                            .toString()
                            .split('.')[0],
                        style: getBoldTextStyle(
                            fontSize: ManagerFontSize.s30, color: Colors.white),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w10),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(ManagerRadius.r10)),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          listOfDays[DateTime.now().weekday - 1].toString(),
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                        Text(
                          ",",
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          width: ManagerWidth.w4,
                        ),
                        Text(
                          listOfMonths[DateTime.now().month - 1].toString(),
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          width: ManagerWidth.w4,
                        ),
                        Text(
                          "${DateTime.now().day}",
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                        Text(
                          ",",
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                        Text(
                          DateTime.now().year.toString(),
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          controller.hijri!,
                          style: getMediumTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomPrayTime(
                        imagePath: ManagerAssets.fajr,
                        prayTimeName: "prayerFajr".tr,
                        prayTime: DateFormat.jm()
                            .format(controller.prayerTimes.fajr)),
                    CustomPrayTime(
                        imagePath: ManagerAssets.dhuhr,
                        prayTimeName: "prayerDhuhr".tr,
                        prayTime: DateFormat.jm()
                            .format(controller.prayerTimes.dhuhr)),
                    CustomPrayTime(
                        imagePath: ManagerAssets.asr,
                        prayTimeName: "prayerAsr".tr,
                        prayTime:
                            DateFormat.jm().format(controller.prayerTimes.asr)),
                    CustomPrayTime(
                        imagePath: ManagerAssets.maghrib,
                        prayTimeName: "prayerMaghrib".tr,
                        prayTime: DateFormat.jm()
                            .format(controller.prayerTimes.maghrib)),
                    CustomPrayTime(
                        imagePath: ManagerAssets.isha,
                        prayTimeName: "prayerIsha".tr,
                        prayTime:
                            DateFormat.jm().format(controller.prayerTimes.isha))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: ManagerHeight.h10,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
            margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ManagerAssets.calender,
                      width: ManagerWidth.w22,
                      height: ManagerHeight.h22,
                    ),
                    SizedBox(
                      width: ManagerWidth.w6,
                    ),
                    Text(
                      "upcomingDates".tr,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s18, color: Colors.black),
                    ),
                  ],
                ),
                const Divider(),
                controller.events.isNotEmpty
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.events.last.title!,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: Colors.lightGreen),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const CalenderScreen(),
                                        transition: Transition.fade);
                                    Get.delete<HomeController>();
                                  },
                                  child: Text(
                                    "seeMore".tr,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s15,
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Text(
                                    "reminderDate".tr,
                                    style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    controller.events.last.pickedDate!,
                                    style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            "noEvent".tr,
                            textAlign: TextAlign.center,
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: Colors.black),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(() => const CalenderScreen(),
                                    transition: Transition.fade);
                                Get.delete<HomeController>();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen),
                              child: Text(
                                "addEvent".tr,
                                style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color: Colors.white),
                              ))
                        ],
                      )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
            margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ManagerAssets.card,
                      width: ManagerWidth.w22,
                      height: ManagerHeight.h22,
                    ),
                    SizedBox(
                      width: ManagerWidth.w6,
                    ),
                    Text(
                      "cardValidity".tr,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s18, color: Colors.black),
                    ),
                  ],
                ),
                const Divider(),
                controller.card.isNotEmpty
                    ? SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  controller.card.last.typeCard!,
                                  style: getBoldTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: Colors.lightGreen),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    Get.to(() => const ShowCard(),
                                        transition: Transition.fade);
                                    Get.delete<HomeController>();
                                  },
                                  child: Text(
                                    "seeMore".tr,
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s15,
                                        decoration: TextDecoration.underline,
                                        color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Row(
                                children: [
                                  Text(
                                    "expiryValidity".tr,
                                    style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: Colors.grey),
                                  ),
                                  Text(
                                    " ${controller.card.last.pickedDate!}",
                                    style: getMediumTextStyle(
                                        fontSize: ManagerFontSize.s16,
                                        color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            "noCard".tr,
                            textAlign: TextAlign.justify,
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: Colors.black),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Get.to(() => const CardScreen(),
                                    transition: Transition.fade);
                                Get.delete<HomeController>();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen),
                              child: Text(
                                "addCard".tr,
                                style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s16,
                                    color: Colors.white),
                              ))
                        ],
                      )
              ],
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10, vertical: ManagerHeight.h10),
            margin: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w10, vertical: ManagerHeight.h4),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(ManagerRadius.r10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      ManagerAssets.pattern,
                      width: ManagerWidth.w26,
                      height: ManagerHeight.h26,
                    ),
                    SizedBox(
                      width: ManagerWidth.w6,
                    ),
                    Text(
                      "duaDay".tr,
                      style: getBoldTextStyle(
                          fontSize: ManagerFontSize.s18, color: Colors.black),
                    ),
                  ],
                ),
                const Divider(),
                Text(
                  controller.dua.toString(),
                  textAlign: TextAlign.justify,
                  style: getRegularTextStyle(
                      fontSize: ManagerFontSize.s16, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ManagerHeight.h10,
          ),
        ]),
      );
    });
  }
}
