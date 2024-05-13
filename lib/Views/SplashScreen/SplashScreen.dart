import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Models/SignInModel.dart';
import 'package:iottive_flutter_task/Preference/Userpreference.dart';
import 'package:iottive_flutter_task/Views/Authentication/LoginScreen.dart';
import 'package:iottive_flutter_task/Views/Home/HomeScreen.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () async {
      // SignInModel? retrievedObject = await UserPreferences().getSignInInfo();
      // if (retrievedObject != null) {
      //   Get.offAll(const HomeScreen());
      // } else {
      //   Get.offAll(const LoginScreen());
      // }
      Get.offAll(const LoginScreen());
    });
    //Get.offAll(const LoginScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Iottive",
                style: TextStyle(fontSize: 20.sp),
              ),
            ),
            // SvgPicture.asset(
            //   "assets/svgs/Vanilla@1x-1.0s-280px-250px.svg",
            // )
          ]

          // [Image.asset("assets/gifs/provider.gif")],
          ),
    );
  }
}
