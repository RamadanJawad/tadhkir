import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tadhkir/controller/allCard_controller.dart';
import 'package:tadhkir/core/cache/cache.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';
import 'package:tadhkir/view/screen/edit_card_screen.dart';
import 'package:tadhkir/view/widget/custom_title.dart';

class BodyAllCard extends StatelessWidget {
  const BodyAllCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllCardController>(
      builder: (controller) => controller.card.isNotEmpty
          ? SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ManagerHeight.h20,
                        vertical: ManagerHeight.h10),
                    width: double.infinity,
                    height: ManagerHeight.h340,
                    padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h6,
                        horizontal: ManagerWidth.w10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ManagerRadius.r10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Text(
                          "noExpiryCard".tr,
                          style: getBoldTextStyle(
                              fontSize: ManagerFontSize.s20,
                              color: Colors.lightGreen),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTitle("number".tr),
                            customTitle("typeCard".tr),
                            customTitle("expiryDate".tr),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isBefore(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: Text(
                                            "${controller.card[index].idCard}",
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s14,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isBefore(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: Text(
                                            "${controller.card[index].typeCard}",
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s14,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isBefore(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: Text(
                                            "${controller.card[index].pickedDate}",
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s14,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: ManagerHeight.h10,
                        vertical: ManagerHeight.h10),
                    width: double.infinity,
                    height: ManagerHeight.h340,
                    padding: EdgeInsets.symmetric(
                        vertical: ManagerHeight.h6,
                        horizontal: ManagerWidth.w10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(ManagerRadius.r10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        Text(
                          "expiryCard".tr,
                          style: getBoldTextStyle(
                              fontSize: ManagerFontSize.s20,
                              color: Colors.lightGreen),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customTitle("number".tr),
                            customTitle("typeCard".tr),
                            customTitle("expiryDate".tr),
                            customTitle("editNewCard".tr),
                          ],
                        ),
                        const Divider(
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isAfter(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: Text(
                                            "${controller.card[index].idCard}",
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s14,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isAfter(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: Text(
                                            "${controller.card[index].typeCard}",
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s14,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 2,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isAfter(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: Text(
                                            "${controller.card[index].pickedDate}",
                                            style: getBoldTextStyle(
                                                fontSize: ManagerFontSize.s14,
                                                color: Colors.black),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                              const VerticalDivider(
                                indent: 0,
                                endIndent: 0,
                                color: Colors.grey,
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.card.length,
                                    itemBuilder: (context, index) {
                                      if (DateTime.now().isAfter(
                                          DateFormat("yyyy-MM-dd").parse(
                                              controller
                                                  .card[index].pickedDate!))) {
                                        return Center(
                                          child: InkWell(
                                            onTap: () {
                                              CacheData().setTitle(controller
                                                  .card[index].title!);
                                              CacheData().setDetails(controller
                                                  .card[index].idCard!);
                                              CacheData().setDate(controller
                                                  .card[index].pickedDate!);
                                              CacheData().setType(controller
                                                  .card[index].typeCard!);
                                              CacheData().setUserId(
                                                  controller.card[index].id!);
                                              CacheData().setTime(controller
                                                  .card[index].pickedTime!);
                                              Get.to(
                                                  () => const EditCardScreen(),
                                                  transition: Transition.fade);
                                              Get.delete<AllCardController>();
                                            },
                                            child: Text(
                                              "editNow".tr,
                                              style: getBoldTextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: ManagerFontSize.s14,
                                                  color: Colors.blueGrey),
                                            ),
                                          ),
                                        );
                                      } else {
                                        return const SizedBox.shrink();
                                      }
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          : Center(
              child: Text(
                "noCard".tr,
                style: getMediumTextStyle(
                    fontSize: ManagerFontSize.s16, color: Colors.grey),
              ),
            ),
    );
  }
}
