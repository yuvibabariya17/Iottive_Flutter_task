import 'package:flutter/material.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Core/Themes/font_constant.dart';
import 'package:sizer/sizer.dart';

getFormButton(Function fun, str, {required bool validate}) {
  return Center(
    child: GestureDetector(
      onTap: () {
        fun();
      },
      child: Container(
        height: SizerUtil.deviceType == DeviceType.mobile ? 6.h : 5.9.h,
        alignment: Alignment.center,
        //  padding: EdgeInsets.only(top: 1.h),
        width: SizerUtil.deviceType == DeviceType.mobile
            ? SizerUtil.width / 1
            : SizerUtil.width / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 5.h : 1.4.h),
          color: validate ? primaryColor : Colors.grey,
          boxShadow: [
            BoxShadow(
                color: validate
                    ? primaryColor.withOpacity(0.2)
                    : Colors.grey.withOpacity(0.2),
                blurRadius: 10.0,
                offset: const Offset(0, 1),
                spreadRadius: 3.0)
          ],
        ),
        child: Text(
          str,
          style: TextStyle(
              color: white,
              fontFamily: fontBold,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 14.sp : 9.sp),
        ),
      ),
    ),
  );
}
