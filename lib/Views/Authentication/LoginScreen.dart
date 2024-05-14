import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
import 'package:iottive_flutter_task/Core/Constant/String_Constant.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Custom_Componant/Form_button.dart';
import 'package:iottive_flutter_task/Utils/log.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Stack(children: [
      SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SvgPicture.asset(
          "assets/svgs/Frame.svg",
          fit: BoxFit.cover,
        ),
      ),
      Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: transparent,
        body: Container(
          color: transparent,
          margin: EdgeInsets.only(top: 12.h, right: 7.w, left: 7.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Text(
                  Strings.login,
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.w700),
                ),
              ]),
              SizedBox(
                height: 0.5.h,
              ),
              Row(
                children: [
                  Text(
                    Strings.loginDetail,
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              getCustomeFormFields(controller.emailCtr, Strings.emailHint, 1),
              SizedBox(
                height: 1.h,
              ),
              getCustomeFormFields(controller.passCtr, Strings.passHint, 2),
              SizedBox(
                height: 7.h,
              ),
              FadeInUp(
                  from: 50,
                  child: Obx(() {
                    return getFormButton(() {
                      if (controller.isFormInvalidate.value == true) {
                        controller.signInAPI(context);
                        logcat("LOGINSUCCESSFUL:::::", "");
                      }
                    }, Strings.login,
                        validate: controller.isFormInvalidate.value);
                  })),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  getCustomeFormFields(
      TextEditingController? controllers, String hint, int index) {
    return Obx(
      () {
        return TextFormField(
          controller: controllers,
          style: TextStyle(fontSize: 10.sp),
          keyboardType:
              index == 1 ? TextInputType.emailAddress : TextInputType.text,
          obscureText: index == 2 ? controller.obsecureText.value : false,
          onChanged: (value) {
            if (index == 1) {
              controller.validateEmail(value);
            } else {
              controller.validatePassword(value);
            }
          },
          decoration: InputDecoration(
            errorText: index == 1
                ? controller.emailModel.value.error
                : controller.passModel.value.error,
            hintText: hint,
            prefixIcon: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  index == 1 ? Icons.email : Icons.password_rounded,
                  color: primaryColor,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Container(
                  color: Colors.grey,
                  width: 0.5.w,
                  height: 4.h,
                ),
                SizedBox(
                  width: 2.w,
                ),
              ],
            ),
            suffixIcon: index == 2
                ? GestureDetector(
                    onTap: () {
                      logcat("OnTAP", "DONE");
                      controller.obsecureText.value =
                          !controller.obsecureText.value;
                      setState(() {});
                    },
                    child: Icon(
                      controller.obsecureText.value == true
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: primaryColor,
                    ),
                  )
                : null,
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return index == 1
                  ? Strings.emailbtnvalidate
                  : Strings.passbtnValidate;
            }
            return null;
          },
        );
      },
    );
  }
}
