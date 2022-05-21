
import 'package:bybit/Screens/HomeScreen.dart';
import 'package:bybit/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'Screens/DerivativesScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    MediaQuery(
        data: const MediaQueryData(),
        child: GetMaterialApp(
          theme: ThemeData.dark(),
          defaultTransition: Transition.cupertino,
          debugShowCheckedModeBanner: false,
          // builder: EasyLoading.init(),
          // home: HomeScreen(),
          home: HomeScreen(),
        ),
      ),
  );
  // configLoading();
}


// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.spinningCircle
//     ..loadingStyle = EasyLoadingStyle.custom
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..userInteractions = false
//     ..dismissOnTap = false
//     ..indicatorSize = 100.0
//     ..fontSize = 18.0
//     ..progressColor = Colors.red
//     ..backgroundColor = Colors.transparent
//     ..indicatorColor = Colors.blue
//     ..textColor = Colors.white
//   // ..maskColor = Colors.blue
//     ..maskType = EasyLoadingMaskType.black
//     ..userInteractions = true
//     ..dismissOnTap = true;
// }
