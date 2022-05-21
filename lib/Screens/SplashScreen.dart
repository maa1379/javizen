import 'package:bybit/Helpers/ColorHelpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'IntroScreen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    Future.delayed(const Duration(seconds: 4)).then((value){
      Get.off(IntroScreen(),transition: Transition.fadeIn,duration: Duration(milliseconds: 500));
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color:  ColorHelpers.backGroundColor,
        child: FadeTransition(
          opacity: _animation,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset("assets/images/logo.png"),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Lottie.asset("assets/anim/loading.json",width: Get.width * .4),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
