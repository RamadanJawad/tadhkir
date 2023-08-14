import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';

void notificationFajr(int hour, int minute) {
  NotificationManager.displayPrayTimeNotification(
      title: "صلاة الفجر",
      description: "حان الان موعد أذان الفجر , لا تنسى صلاتك",
      hour: hour,
      minute: minute,
      id: 1);
}

void notificationDhuhr(int hour, int minute) {
  NotificationManager.displayPrayTimeNotification(
      title: "صلاة الظهر",
      description: "حان الان موعد أذان الظهر , لا تنسى صلاتك",
      hour: hour,
      minute: minute,
      id: 2);
}

void notificationAsr(int hour, int minute) {
  NotificationManager.displayPrayTimeNotification(
      title: "صلاة العصر",
      description: "حان الان موعد أذان العصر , لا تنسى صلاتك",
      hour: hour,
      minute: minute,
      id: 3);
}

void notificationMaghrib(int hour, int minute) {
  NotificationManager.displayPrayTimeNotification(
      title: "صلاة المغرب",
      description: "حان الان موعد أذان المغرب , لا تنسى صلاتك",
      hour: hour,
      minute: minute,
      id: 4);
}

void notificationIsha(int hour, int minute) {
  NotificationManager.displayPrayTimeNotification(
      title: "صلاة العشاء",
      description: "حان الان موعد أذان العشاء , لا تنسى صلاتك",
      hour: hour,
      minute: minute,
      id: 5);
}
