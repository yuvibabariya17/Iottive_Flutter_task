import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
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
                margin: EdgeInsets.only(right: 15.w),
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: fontBold,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: SizerUtil.deviceType == DeviceType.mobile
                          ? 18.sp
                          : 12.sp),
                ),
              ),
            ),
          ],
        ),
      ),
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

