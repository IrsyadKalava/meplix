import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meplix/ui/component/constant.dart';
import 'package:meplix/ui/component/label_text.dart';
import 'package:meplix/ui/screen/home_navigation.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() async {
    var time = const Duration(seconds: 3);
    return Timer(time, () {
      Get.offAll(HomeNavigation());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Image.asset("assets/img/splash.png", height: 90),
      ),
    );
  }
}
