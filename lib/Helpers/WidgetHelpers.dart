import 'package:bybit/Helpers/ColorHelpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetHelpers {
  static buildTextField(
      {String? text,
        TextEditingController? controller,
      ValueChanged<String>? onChange,
      FormFieldValidator<String>? validator}) {
    return Container(
      height: Get.height * .06,
      width: Get.width,
      decoration: const BoxDecoration(
          boxShadow: [
        BoxShadow(color: Colors.white12, blurRadius: 5, spreadRadius: 2.5)
      ]),
      // color: Colors.transparent,
      margin: EdgeInsets.symmetric(horizontal: Get.width * .05),
      child: TextFormField(
        controller: controller,
        validator: validator,
        onChanged: onChange,
        decoration: InputDecoration(
          filled: true,
          labelText: text,
          labelStyle: const TextStyle(color: Colors.grey, fontSize: 18),
          fillColor: ColorHelpers.textFieldColor,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.orange, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.orange, width: 1),
          ),
        ),
      ),
    );
  }
}
