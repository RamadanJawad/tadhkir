import 'package:intl/intl.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';

saveData(HomeController controller) {
  SharedPrefController().fajr(
      hour: controller.prayerTimes.fajr.hour,
      minute: controller.prayerTimes.fajr.minute,
      prayTime: DateFormat.jm().format(controller.prayerTimes.fajr));
  SharedPrefController().shrouq(
      prayTime: DateFormat.jm().format(controller.prayerTimes.sunrise));
  SharedPrefController().dhur(
      hour: controller.prayerTimes.dhuhr.hour,
      minute: controller.prayerTimes.dhuhr.minute,
      prayTime: DateFormat.jm().format(controller.prayerTimes.dhuhr));
  SharedPrefController().asr(
      hour: controller.prayerTimes.asr.hour,
      minute: controller.prayerTimes.asr.minute,
      prayTime: DateFormat.jm().format(controller.prayerTimes.asr));
  SharedPrefController().magrab(
      hour: controller.prayerTimes.maghrib.hour,
      minute: controller.prayerTimes.maghrib.minute,
      prayTime: DateFormat.jm().format(controller.prayerTimes.maghrib));
  SharedPrefController().isha(
      hour: controller.prayerTimes.isha.hour,
      minute: controller.prayerTimes.isha.minute,
      prayTime: DateFormat.jm().format(controller.prayerTimes.isha));
}
