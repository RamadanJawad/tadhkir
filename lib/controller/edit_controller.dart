import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/caledner_controller.dart';
import 'package:tadhkir/core/cache/cache.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/model/event.dart';
import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/view/screen/calender_screen.dart';

class EditController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  BuildContext context = Get.context!;
  DateTime? pickedDate;
  TimeOfDay? pickedTime;
  CalendersController calendersController = CalendersController();
  MyDb myDb = MyDb();

  getData() {
    titleController.text = CacheData().getTitle();
    descriptionController.text = CacheData().getDetails();
    dateController.text = CacheData().getDate();
    timeController.text = CacheData().getTime();
    pickedDate = new DateFormat("yyyy-MM-dd").parse(dateController.text);
    pickedTime = parseTimeStringToTimeOfDay(timeController.text);
    update();
  }

  TimeOfDay parseTimeStringToTimeOfDay(String timeString) {
    final DateFormat inputFormat = DateFormat("hh:mm a");
    DateTime dateTime = inputFormat.parse(timeString);
    return TimeOfDay.fromDateTime(dateTime);
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

  editEvent() async {
    Event event = Event(
        details: descriptionController.text,
        title: titleController.text,
        isNotification: "true",
        pickedDate: dateController.text,
        pickedTime: timeController.text,
        id: CacheData().getUserId());
    final response = await myDb.updateEvent(event);
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

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
