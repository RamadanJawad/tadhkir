import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/event_controller.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/view/widget/custom_field.dart';

class BodyEvent extends StatelessWidget {
  const BodyEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventController>(
      init: EventController(),
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: ManagerHeight.h10,
              ),
              CustomField(
                  title: "event".tr,
                  editingController: controller.titleController,
                  hint: "titleEvent".tr),
              CustomField(
                  title: "description".tr,
                  editingController: controller.descriptionController,
                  hint: "inputDescription".tr),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: ManagerWidth.w6),
                            child: Text(
                              "date".tr,
                              style: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s18,
                                  color: ManagerColors.black),
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h6,
                          ),
                          TextFormField(
                            cursorColor: Colors.grey,
                            controller: controller.dateController,
                            onTap: () async {
                              controller.formateDate();
                            },
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: ManagerColors.black),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: ManagerWidth.w6,
                                  vertical: ManagerHeight.h10),
                              hintText: "selectDate".tr,
                              suffixIconColor: Colors.grey,
                              suffixIcon: Icon(Icons.calendar_month),
                              hintStyle: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(ManagerRadius.r10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(ManagerRadius.r10),
                                  borderSide: const BorderSide(
                                      color: Colors.lightGreen)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ManagerWidth.w10,
                  ),
                  Expanded(
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: ManagerWidth.w6),
                            child: Text(
                              "reminderTime".tr,
                              style: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s18,
                                  color: ManagerColors.black),
                            ),
                          ),
                          SizedBox(
                            height: ManagerHeight.h6,
                          ),
                          TextFormField(
                            cursorColor: Colors.grey,
                            controller: controller.timeController,
                            onTap: () async {
                              controller.formateTime();
                            },
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s16,
                                color: ManagerColors.black),
                            decoration: InputDecoration(
                              suffixIcon: const Icon(Icons.timer_sharp),
                              suffixIconColor: Colors.grey,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: ManagerWidth.w6,
                                  vertical: ManagerHeight.h10),
                              hintText: "selectTime".tr,
                              hintStyle: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s16,
                                  color: ManagerColors.grey),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(ManagerRadius.r10),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(ManagerRadius.r10),
                                  borderSide: const BorderSide(
                                      color: Colors.lightGreen)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ManagerHeight.h20,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.titleController.text.isEmpty &&
                        controller.descriptionController.text.isEmpty &&
                        controller.dateController.text.isEmpty &&
                        controller.timeController.text.isEmpty) {
                      Get.snackbar("", "",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                          margin: const EdgeInsets.all(10),
                          titleText: Text(
                            "errorAdd".tr,
                            textDirection: TextDirection.rtl,
                            style: getBoldTextStyle(
                                fontSize: ManagerFontSize.s15,
                                color: ManagerColors.white),
                          ),
                          messageText: Text(
                            "messageValid".tr,
                            textDirection: TextDirection.rtl,
                            style: getRegularTextStyle(
                                fontSize: ManagerFontSize.s15,
                                color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.error,
                            color: Colors.white,
                          ));
                    } else {
                      controller.addEvent();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(ManagerRadius.r10)),
                      padding: EdgeInsets.symmetric(
                          horizontal: ManagerWidth.w40,
                          vertical: ManagerHeight.h8)),
                  child: Text(
                    "addEvent".tr,
                    style: getMediumTextStyle(
                        fontSize: ManagerFontSize.s16,
                        color: ManagerColors.white),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
