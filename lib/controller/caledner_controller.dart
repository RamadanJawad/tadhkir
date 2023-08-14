import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/core/cache/cache.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/model/event.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/view/screen/edit_screen.dart';

class CalendersController extends GetxController {
  DateTime selectedDate = DateTime.now();
  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();
  List<Event> events = [];
  MyDb myDb = MyDb();

  onChange(int index) async {
    currentDateSelectedIndex = index;
    selectedDate = DateTime.now().add(Duration(days: index));
    await readData();
    update();
  }

  readData() async {
    events = await myDb.readEvent();
    update();
  }

  void onSelected(
      {required select,
      required int id,
      required title,
      required details,
      required date,
      required time}) {
    switch (select) {
      case 0:
        Get.defaultDialog(
          title: "deleteEvent".tr,
          middleText: "messageDelete".tr,
          titleStyle: getBoldTextStyle(
              fontSize: ManagerFontSize.s16, color: Colors.black),
          middleTextStyle: getMediumTextStyle(
              fontSize: ManagerFontSize.s16, color: Colors.black),
          cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey, foregroundColor: Colors.white),
            onPressed: () {
              Get.back();
            },
            child: Text(
              "no".tr,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s16, color: Colors.white),
            ),
          ),
          confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, foregroundColor: Colors.white),
            onPressed: () async {
              deleteEvent(id);
            },
            child: Text(
              "yes".tr,
              style: getBoldTextStyle(
                  fontSize: ManagerFontSize.s15, color: Colors.white),
            ),
          ),
        );
        break;
      case 1:
        CacheData().setTitle(title);
        CacheData().setDetails(details);
        CacheData().setDate(date);
        CacheData().setTime(time);
        CacheData().setUserId(id);
        Get.to(() => const EditScreen());
        Get.delete<CalendersController>();
        break;
      case 2:
        break;
    }
  }

  void deleteEvent(int id) async {
    Event event = Event(
      id: id,
    );
    await myDb.deleteEvent(event);
    Get.back();
    readData();
  }

  @override
  void onInit() {
    super.onInit();
    readData();
  }

  @override
  void dispose() {
    super.dispose();
    Get.delete<CalendersController>();
  }
}
