import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/allCard_controller.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/cache/cache.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/model/card.dart';
import 'package:tadhkir/core/notification/awesome_notifications_manager.dart';
import 'package:tadhkir/view/screen/show_card.dart';

class EditCardController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  BuildContext context = Get.context!;
  DateTime? pickedDate;
  DateTime? pickedTime;
  MyDb myDb = MyDb();
  String selectItem = '  اختر نوع البطاقة';

  getData() {
    titleController.text = CacheData().getTitle();
    descriptionController.text = CacheData().getDetails();
    dateController.text = CacheData().getDate();
    timeController.text = CacheData().getTime();
    pickedDate = new DateFormat("yyyy-MM-dd").parse(dateController.text);
    pickedTime = new DateFormat("yyyy-MM-dd").parse(timeController.text);
    selectItem = CacheData().getType();
    update();
  }

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

  List<String> time = [
    "ثلاث شهور",
    "شهر",
    "اسبوع",
    "يوم",
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
                  primary: Colors.lightGreen,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
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
                  primary: Colors.lightGreen,
                  onPrimary: Colors.white,
                  onSurface: Colors.black,
                ),
              ),
              child: child!);
        });
    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedTime!);
    timeController.text = formattedDate;
    update();
  }

  updateCard() async {
    CardDate cardDate = CardDate(
        idCard: descriptionController.text,
        title: titleController.text.isEmpty ? "no_title" : titleController.text,
        isNotification: "true",
        pickedDate: dateController.text.toString(),
        pickedTime: timeController.text.toString(),
        typeCard: selectItem,
        id: CacheData().getUserId());
    final response = await myDb.updateCard(cardDate);
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

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
