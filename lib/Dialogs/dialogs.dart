import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:sizer/sizer.dart';
import '../core/themes/font_constant.dart';

void showMessage(
    {required BuildContext context,
    Function? callback,
    String? title,
    String? message,
    String? positiveButton,
    String? negativeButton}) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => FadeInUp(
            duration: const Duration(milliseconds: 300),
            animate: true,
            from: 30,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.light,
                scaffoldBackgroundColor: Colors.white,
                textTheme: CupertinoTextThemeData(
                  textStyle: TextStyle(color: Colors.black),
                ),
              ),
              child: CupertinoAlertDialog(
                title: Text(
                  title!,
                  style: TextStyle(fontFamily: fontBold, fontSize: 15.sp),
                ),
                content: Text(
                  message!,
                  style: const TextStyle(
                    fontFamily: fontRegular,
                  ),
                ),
                actions: [
                  if (negativeButton!.isNotEmpty)
                    CupertinoDialogAction(
                        child: Text(
                          negativeButton,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: fontMedium,
                            color: black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  if (positiveButton!.isNotEmpty)
                    CupertinoDialogAction(
                        child: Text(
                          positiveButton,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontFamily: fontMedium,
                            color: black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          callback!();
                        })
                ],
              ),
            ),
          ));
}
