import 'dart:async';

import 'package:chat_gpt/constant/app_assets.dart';
import 'package:chat_gpt/screens/home_pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constant/app_icon.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 5),).then((value) => Get.offAll(const HomeScreen(),transition: Transition.rightToLeft)
    );
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image.asset(AppAssets.splashScreenImage),
      ),
    );
  }
}

