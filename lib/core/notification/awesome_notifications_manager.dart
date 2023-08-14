import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class NotificationManager {
  static void displayPrayTimeNotification({
    required String title,
    required String description,
    required int hour,
    required int minute,
    required int id,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'prayTime_channel',
        title: title,
        body: description,
        backgroundColor: Colors.white,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }

  static void displayNotification({
    required String title,
    required String description,
    required int hour,
    required int minute,
    required int id,
    required int day,
    required int month,
    required int year,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'event_channel',
        title: title,
        body: description,
        backgroundColor: Colors.white,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        day: day,
        year: year,
        month: month,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
      ),
    );
  }

  static void displayCardNotification({
    required String title,
    required String description,
    required int id,
    required int day,
    required int month,
    required int year,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'event_channel',
        title: title,
        body: description,
        backgroundColor: Colors.white,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: 10,
        minute: 00,
        day: day,
        year: year,
        month: month,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
      ),
    );
  }

  static void displayAdkarNotification({
    required String title,
    required String description,
    required int id,
    required int hour,
    required int minute,
  }) {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'adkar_channel',
        title: title,
        body: description,
        backgroundColor: Colors.white,
        wakeUpScreen: true,
      ),
      schedule: NotificationCalendar(
        hour: hour,
        minute: minute,
        second: 0,
        millisecond: 0,
        allowWhileIdle: true,
        repeats: true,
      ),
    );
  }
}
