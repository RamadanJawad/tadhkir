import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/caledner_controller.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/model/event.dart';
import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/view/screen/calender_screen.dart';

class EventController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  BuildContext context = Get.context!;
  TimeOfDay? pickedTime;
  DateTime? pickedDate;
  MyDb myDb = MyDb();
  CalendersController calendersController = CalendersController();

  formateDate() async {
    pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.lightGreen, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
              ),
              child: child!);
        });
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate!);
    dateController.text = formattedDate;
    update();
  }

  formateTime() async {
    pickedTime = await showTimePicker(
        initialTime: TimeOfDay.now(),
        context: context,
        builder: (context, child) {
          return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.lightGreen, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
              ),
              child: child!);
        });
    if (pickedTime != null) {
      String parsedTime = pickedTime!.format(context).toString();
      timeController.text = parsedTime;
    }
    update();
  }

  addEvent() async {
    Event event = Event(
        details: descriptionController.text,
        title: titleController.text,
        isNotification: "true",
        pickedDate: dateController.text.toString(),
        pickedTime: timeController.text.toString());
    final response = await myDb.insertData(event);
    if (response != null) {
      NotificationManager.displayNotification(
          title: titleController.text,
          description: descriptionController.text,
          hour: pickedTime!.hour,
          minute: pickedTime!.minute,
          day: pickedDate!.day,
          month: pickedDate!.month,
          year: pickedDate!.year,
          id: 10);
      update();
      await calendersController.readData();
      update();
      Get.off(() => const CalenderScreen(), transition: Transition.fade);
    }
    update();
  }
}
