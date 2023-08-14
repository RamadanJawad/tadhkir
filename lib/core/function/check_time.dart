import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/resources/manager_assets.dart';

check(HomeController controller) {
  if (controller.prayerTimes.nextPrayer().toString() == "Prayer.none") {
    controller.currentPray = "prayerFajr".tr;
    controller.image = ManagerAssets.fajr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.fajr);
    controller.dateTime =
        controller.prayerTimes.fajr.toLocal().add(const Duration(days: 1));
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.isha") {
    controller.currentPray = "prayerIsha".tr;
    controller.image = ManagerAssets.isha;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.isha);
    controller.dateTime = controller.prayerTimes.isha;
  } else if (controller.prayerTimes.nextPrayer().toString() ==
      "Prayer.maghrib") {
    controller.currentPray = "prayerMaghrib".tr;
    controller.image = ManagerAssets.maghrib;
    controller.prayTime =
        DateFormat.jm().format(controller.prayerTimes.maghrib);
    controller.dateTime = controller.prayerTimes.maghrib;
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.asr") {
    controller.currentPray = "prayerAsr".tr;
    controller.image = ManagerAssets.asr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.asr);
    controller.dateTime = controller.prayerTimes.asr;
  } else if (controller.prayerTimes.nextPrayer().toString() == "Prayer.dhuhr") {
    controller.currentPray = "prayerDhuhr".tr;
    controller.image = ManagerAssets.dhuhr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.dhuhr);
    controller.dateTime = controller.prayerTimes.dhuhr;
  } else {
    controller.currentPray = "prayerFajr".tr;
    controller.image = ManagerAssets.fajr;
    controller.prayTime = DateFormat.jm().format(controller.prayerTimes.fajr);
    controller.dateTime = controller.prayerTimes.fajr.toLocal();
  }
}
