import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginAndRegisterController extends GetxController with GetSingleTickerProviderStateMixin{
  late TabController tabController;
  RxBool isCheck = false.obs;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.orange;
    }
    return Colors.orange;
  }


  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }


  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}