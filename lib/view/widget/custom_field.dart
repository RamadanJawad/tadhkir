import 'package:flutter/material.dart';
import 'package:tadhkir/core/resources/manager_colors.dart';
import 'package:tadhkir/core/resources/manager_fonts.dart';
import 'package:tadhkir/core/resources/manager_size_util.dart';
import 'package:tadhkir/core/resources/manager_styles.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.title,
      required this.editingController,
      required this.hint,
      this.keyboardType = TextInputType.text});

  final String title;
  final TextEditingController editingController;
  final String hint;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(right: ManagerWidth.w8),
          child: Text(
            title,
            style: getRegularTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          ),
        ),
        SizedBox(
          height: ManagerHeight.h6,
        ),
        TextFormField(
          keyboardType: keyboardType,
          cursorColor: Colors.grey,
          controller: editingController,
          style: getRegularTextStyle(
              fontSize: ManagerFontSize.s16, color: ManagerColors.black),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: ManagerWidth.w6, vertical: ManagerHeight.h10),
            hintText: hint,
            hintStyle: getRegularTextStyle(
                fontSize: ManagerFontSize.s16, color: ManagerColors.grey),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                borderSide: const BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(ManagerRadius.r10),
                borderSide: const BorderSide(color: Colors.lightGreen)),
          ),
        ),
      ],
    );
  }
}
