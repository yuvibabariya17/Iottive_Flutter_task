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
                      fontSize: 14.sp),
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
            height: 4.h,
            width: 20.w,
            decoration: const BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            margin: EdgeInsets.only(right: 5.w),
            child: Center(
                child: Text(
              str,
              style: TextStyle(
                  color: white, fontSize: 8.sp, fontWeight: FontWeight.w600),
            ))),
      )
    ],
  );
}

Widget commonBackPress(callback) {
  return Container(
    margin: EdgeInsets.only(left: 5.5.w),
    child: GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
          padding: const EdgeInsets.all(2),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 2.2.h,
          )),
    ),
  );
}

getdivider() {
  return Divider(
    height: 3.5.h,
    // indent: 1.h,
    endIndent: 2.h,
    thickness: 1,
    color: black.withOpacity(0.5),
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
                title: Text(
                  "Log Out",
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: black,
                    fontFamily: fontBold,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: Text(
                  "Are you sure to Logout?",
                  style: TextStyle(
                    fontSize: 10.sp,
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
                    child: Text('No',
                        style: TextStyle(
                          fontSize: 10.sp,
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
                    child: Text('Yes',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: black,
                          fontFamily: fontBold,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
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

