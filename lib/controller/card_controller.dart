import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/allCard_controller.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/model/card.dart';
import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/view/screen/show_card.dart';

class CardController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  BuildContext context = Get.context!;
  DateTime? pickedDate;
  DateTime? pickedTime;
  MyDb myDb = MyDb();
  String selectItem = "";

  onChange(select) {
    selectItem = select;
    update();
  }

  List<String> items = [
    "بطاقة شخصية",
    "عقد عمل",
    "جواز سفر",
    "عقد ايجار",
    "تأمين",
    "رخصة القيادة",
    "بطاقة تموينية",
    "أخرى"
  ];
  HomeController homeController = HomeController();
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
    pickedTime = await showDatePicker(
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
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime!);
    timeController.text = formattedDate;
    update();
  }

  addCard() async {
    CardDate cardDate = CardDate(
      idCard: descriptionController.text,
      title: titleController.text.isEmpty ? "no_title" : titleController.text,
      isNotification: "true",
      pickedDate: dateController.text.toString(),
      typeCard: selectItem,
      pickedTime: timeController.text,
    );
    final response = await myDb.insertCard(cardDate);
    if (response != null) {
      NotificationManager.displayCardNotification(
          title: titleController.text,
          description:
              "${descriptionController.text} بتاريخ ${dateController.text}",
          day: pickedTime!.day,
          month: pickedTime!.month,
          year: pickedTime!.year,
          id: 20);
      update();
      await homeController.readCard();
      await AllCardController().readCard();
      update();
      Get.off(() => const ShowCard(), transition: Transition.fade);
    }
    update();
  }
}
