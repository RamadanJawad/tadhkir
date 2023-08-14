import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tadhkir/controller/home_controller.dart';
import 'package:tadhkir/core/shared/shared_perf.dart';
import 'package:tadhkir/view/widget/body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Directionality(
      textDirection: SharedPrefController().language == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: const Scaffold(
        body: SafeArea(
          child: BodyHome(),
        ),
      ),
    );
  }
}
