import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/caledner_controller.dart';
import 'package:tadhkir/core/data/day.dart';
import 'package:tadhkir/core/data/month.dart';
import 'package:tadhkir/core/resources/manager_assets.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/view/widget/custom_popMenu.dart';

class BodyCalender extends StatelessWidget {
  const BodyCalender({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CalendersController>(
      builder: (controller) {
        return Column(
          children: [
            SizedBox(height: ManagerHeight.h10),
            Container(
                height: ManagerHeight.h90,
                margin: const EdgeInsets.all(5),
                child: SizedBox(
                    child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(width: ManagerWidth.w10);
                  },
                  itemCount: 365,
                  controller: controller.scrollController,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        controller.onChange(index);
                      },
                      child: Container(
                        height: ManagerHeight.h80,
                        width: ManagerWidth.w60,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color:
                                    controller.currentDateSelectedIndex == index
                                        ? Colors.lightGreen
                                        : Colors.grey),
                            color: controller.currentDateSelectedIndex == index
                                ? Colors.lightGreen
                                : Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                listOfMonths[DateTime.now()
                                            .add(Duration(days: index))
                                            .month -
                                        1]
                                    .toString(),
                                style: getRegularTextStyle(
                                    fontSize: ManagerFontSize.s12,
                                    color:
                                        controller.currentDateSelectedIndex ==
                                                index
                                            ? Colors.white
                                            : Colors.grey)),
                            SizedBox(
                              height: ManagerHeight.h6,
                            ),
                            Text(
                                DateTime.now()
                                    .add(Duration(days: index))
                                    .day
                                    .toString(),
                                style: getBoldTextStyle(
                                    fontSize: ManagerFontSize.s20,
                                    color:
                                        controller.currentDateSelectedIndex ==
                                                index
                                            ? Colors.white
                                            : Colors.grey)),
                            SizedBox(
                              height: ManagerHeight.h6,
                            ),
                            Text(
                              listOfDays[DateTime.now()
                                          .add(Duration(days: index))
                                          .weekday -
                                      1]
                                  .toString(),
                              style: getRegularTextStyle(
                                  fontSize: ManagerFontSize.s14,
                                  color: controller.currentDateSelectedIndex ==
                                          index
                                      ? Colors.white
                                      : Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ))),
            const Divider(),
            Expanded(
              child: controller.events.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.events.length,
                      itemBuilder: (context, index) {
                        if (DateFormat('yyyy-MM-dd')
                                .format(controller.selectedDate) ==
                            controller.events[index].pickedDate!) {
                          return Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: ManagerWidth.w6,
                            ),
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius:
                                    BorderRadius.circular(ManagerRadius.r10)),
                            margin: EdgeInsets.symmetric(
                                horizontal: ManagerWidth.w10,
                                vertical: ManagerHeight.h4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      controller.events[index].title!,
                                      style: getBoldTextStyle(
                                          fontSize: ManagerFontSize.s16,
                                          color: Colors.lightGreen),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: showPopMenu(
                                        onSelected: (select) =>
                                            controller.onSelected(
                                                select: select,
                                                id: controller
                                                    .events[index].id!,
                                                title: controller
                                                    .events[index].title,
                                                details: controller
                                                    .events[index].details,
                                                date: controller
                                                    .events[index].pickedDate,
                                                time: controller
                                                    .events[index].pickedTime),
                                      ),
                                    )
                                  ],
                                ),
                                Text(
                                  controller.events[index].details!,
                                  style: getRegularTextStyle(
                                      fontSize: ManagerFontSize.s16,
                                      color: Colors.black),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "${controller.events[index].pickedTime}",
                                    style: getRegularTextStyle(
                                        fontSize: ManagerFontSize.s12,
                                        color: ManagerColors.grey),
                                  ),
                                )
                              ],
                            ),
                          );
                        } else {
                          return const SizedBox.shrink();
                        }
                      },
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ManagerAssets.noEvent,
                          width: ManagerWidth.w100,
                          color: Colors.grey,
                        ),
                        Text(
                          "noEvent".tr,
                          textAlign: TextAlign.center,
                          style: getRegularTextStyle(
                              fontSize: ManagerFontSize.s16,
                              color: Colors.black),
                        )
                      ],
                    ),
            )
          ],
        );
      },
    );
  }
}
