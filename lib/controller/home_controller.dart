import 'package:adhan/adhan.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/data/dua.dart';
import 'package:tadhkir/core/function/notification.dart';
import 'package:tadhkir/core/locale/local_controller.dart';
import 'package:tadhkir/core/model/event.dart';
import 'package:tadhkir/core/model/card.dart';
import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';

class HomeController extends GetxController {
  late PrayerTimes prayerTimes;
  late Coordinates coordinates;
  late CalculationParameters parameter;
  late String currentPray;
  late String prayTime;
  late LocationPermission permission;
  late String image;
  late DateTime dateTime = DateTime.now();
  MyDb myDb = MyDb();
  List<Event> events = [];
  List<CardDate> card = [];
  final controller = Get.put(LocalController());
  late var dua;
  String? hijri;

  showDate() {
    var today = HijriCalendar.now();
    hijri = today.fullDate();
  }

  readEvent() async {
    events = await myDb.readEvent();
    update();
  }

  readCard() async {
    card = await myDb.readCard();
    update();
  }

  checkNotification() async {
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value1") == true) {
        notificationFajr(prayerTimes.fajr.hour, prayerTimes.fajr.minute);
      } else {
        AwesomeNotifications().cancelSchedule(1);
      }
      update();
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value2") == true) {
        notificationDhuhr(prayerTimes.dhuhr.hour, prayerTimes.dhuhr.minute);
      } else {
        AwesomeNotifications().cancelSchedule(2);
      }
      update();
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value3") == true) {
        notificationAsr(prayerTimes.asr.hour, prayerTimes.asr.minute);
      } else {
        AwesomeNotifications().cancelSchedule(3);
      }
      update();
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value4") == true) {
        notificationMaghrib(
            prayerTimes.maghrib.hour, prayerTimes.maghrib.minute);
      } else {
        AwesomeNotifications().cancelSchedule(4);
      }
      update();
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value5") == true) {
        notificationIsha(prayerTimes.isha.hour, prayerTimes.isha.minute);
      } else {
        AwesomeNotifications().cancelSchedule(5);
      }
      update();
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value6") == true) {
        NotificationManager.displayAdkarNotification(
            title: "أذكار الصباح",
            description: "لا تنسى قراءة أذكار الصباح فهي حصنك المنيع",
            id: 6,
            hour: 6,
            minute: 00);
      } else {
        AwesomeNotifications().cancelSchedule(6);
      }
      update();
    });
    Future.delayed(const Duration(seconds: 1), () {
      if (SharedPrefController().status(key: "value7") == true) {
        NotificationManager.displayAdkarNotification(
            title: "أذكار المساء",
            description: "لا تنسى قراءة أذكار المساء فهي حصنك المنيع",
            id: 7,
            hour: 20,
            minute: 00);
      } else {
        AwesomeNotifications().cancelSchedule(7);
      }
      update();
    });
  }

  readData() async {
    dua = (sunnah..shuffle()).first;
    update();
  }

  initPryTime() {
    parameter = CalculationMethod.egyptian.getParameters();
    parameter.madhab = Madhab.shafi;
    coordinates = Coordinates(SharedPrefController().latitude ?? 26.820553,
        SharedPrefController().longitude ?? 30.802498);
    prayerTimes = PrayerTimes.today(coordinates, parameter);
    update();
  }

  @override
  void onInit() {
    readData();
    showDate();
    initPryTime();
    super.onInit();
    readEvent();
    readCard();
    checkNotification();
  }
}
