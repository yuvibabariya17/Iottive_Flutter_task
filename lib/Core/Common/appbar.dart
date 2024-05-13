import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Preference/Userpreference.dart';
import 'package:iottive_flutter_task/Views/Authentication/LoginScreen.dart';
import 'package:sizer/sizer.dart';

import '../themes/font_constant.dart';

getCommonToolbar(title, Function? callback) {
  return Row(
    children: [
      commonBackPress(callback),
      Expanded(
        flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Container(
                margin: EdgeInsets.only(right: 12.w),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: fontBold,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

getToolbar(title, Function? callback, String str, Function? ontap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        // flex: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInDown(
              child: Container(
                margin: EdgeInsets.only(left: 22.w),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: fontBold,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 15.sp),
                ),
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () {
          ontap!();
        },
        child: Container(
            color: black,
            height: 4.h,
            width: 20.w,
            margin: EdgeInsets.only(right: 5.w),
            child: Center(
                child: Text(
              str,
              style: const TextStyle(
                color: white,
              ),
            ))),
      )
    ],
  );
}

Widget commonBackPress(callback) {
  return Container(
    margin: EdgeInsets.only(
        left: SizerUtil.deviceType == DeviceType.mobile ? 5.5.w : 4.w),
    child: GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
          padding: const EdgeInsets.all(2),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 2.h,
          )),
    ),
  );
}

// ignore: non_constant_identifier_names
Future<Object?> PopupDialogs(BuildContext context) {
  return showGeneralDialog(
      barrierColor: black.withOpacity(0.6),
      transitionBuilder: (context, a1, a2, widget) {
        final curvedValue = Curves.easeInOut.transform(a1.value);
        return Transform.translate(
          offset: Offset(0, (1 - curvedValue) * 400),
          child: Opacity(
              opacity: a1.value,
              child: CupertinoAlertDialog(
                title: const Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 18,
                    color: black,
                    fontFamily: fontBold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: const Text(
                  "Are you sure to SignOut?",
                  style: TextStyle(
                    fontSize: 13,
                    color: black,
                    fontFamily: fontMedium,
                  ),
                ),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDefaultAction: true,
                    isDestructiveAction: true,
                    child: const Text('No',
                        style: TextStyle(
                          fontSize: 15,
                          color: black,
                          fontFamily: fontBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                      UserPreferences().logout();
                      Get.offAll(const LoginScreen());
                    },
                    isDefaultAction: true,
                    isDestructiveAction: true,
                    child: const Text('Yes',
                        style: TextStyle(
                          fontSize: 15,
                          color: black,
                          fontFamily: fontBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  // The "No" button
                ],
              )),
        );
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, animation1, animation2) {
        return Container();
      });
}


// ignore: non_constant_identifier_names

