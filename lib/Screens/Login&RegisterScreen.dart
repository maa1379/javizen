import 'package:bybit/Controllers/LoginAndRegisterController.dart';
import 'package:bybit/Helpers/ColorHelpers.dart';
import 'package:bybit/Helpers/WidgetHelpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class LoginAndRegisterScreen extends StatelessWidget {
  LoginAndRegisterScreen({Key? key}) : super(key: key);

  LoginAndRegisterController controller = Get.put(LoginAndRegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorHelpers.backGroundColor,
        body: SingleChildScrollView(
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  _buildAppBar(),
                  SizedBox(
                    height: Get.height * .025,
                  ),
                  _buildTabBar(),
                  SizedBox(
                    height: Get.height * .06,
                  ),
                  Container(
                    height: Get.height,
                    width: Get.width,
                    padding: EdgeInsets.only(top: Get.height * .02),
                    child: TabBarView(children: [
                      _buildBody(),
                      _buildBody(),
                    ], controller: controller.tabController),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildBody() {
    return AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(milliseconds: 275),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            WidgetHelpers.buildTextField(
                text: "Email", onChange: (value) {}, validator: (value) {}),
            SizedBox(
              height: Get.height * .05,
            ),
            WidgetHelpers.buildTextField(
                text: "Password", onChange: (value) {}, validator: (value) {}),
            SizedBox(
              height: Get.height * .05,
            ),
            _buildCheckBox(),
            SizedBox(
              height: Get.height * .01,
            ),
            _buildBtn(),
          ],
        ),
      ),
    );
  }

  _buildTabBar() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        height: Get.height * .05,
        width: Get.width * .4,
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          controller: controller.tabController,
          indicatorColor: Colors.orange,
          unselectedLabelColor: Colors.white,
          unselectedLabelStyle: const TextStyle(color: Colors.white),
          tabs: const [
            Text(
              "Email",
              style: TextStyle(color: Colors.orange),
            ),
            Text(
              "Mobile",
              style: TextStyle(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }

  _buildAppBar() {
    return Container(
      height: Get.height * .15,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign in",
                    style: TextStyle(color: Colors.orange, fontSize: 18),
                  ))
            ],
          ),
          Spacer(),
          const Text(
            "Let's get started",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ],
      ),
    );
  }

  _buildBtn() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: Get.height * .06,
        width: Get.width,
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * .05, vertical: Get.height * .015),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
            child: Text(
          "Continue",
          style: TextStyle(color: Colors.black, fontSize: 16),
        )),
      ),
    );
  }

  _buildCheckBox() {
    return Obx(() {
      return Row(
        children: [
          SizedBox(
            width: Get.width * .02,
          ),
          Checkbox(
            checkColor: Colors.black,
            value: controller.isCheck.value,
            onChanged: (value) {
              controller.isCheck.value = value!;
            },
            fillColor: MaterialStateProperty.resolveWith(controller.getColor),
          ),
          const Text(
            "I have read and agree terms of service\n and privacy policy",
            maxLines: 2,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      );
    });
  }
}
