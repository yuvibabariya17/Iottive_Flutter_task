import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      SignInModel? retrievedObject = await UserPreferences().getSignInInfo();
      if (retrievedObject != null) {
        Get.offAll(const HomeScreen());
      } else {
        Get.offAll(const LoginScreen());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                "assets/svgs/Frame.svg",
                fit: BoxFit.cover,
              ),
            ),
            const Center(
              child: Text(
                "IOTTIVE",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
