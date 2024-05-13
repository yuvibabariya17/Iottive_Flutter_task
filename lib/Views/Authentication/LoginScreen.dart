import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Custom_Componant/Form_button.dart';
import 'package:iottive_flutter_task/Custom_Componant/TextField.dart';
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
    return Scaffold(
      body: Stack(children: [
        // Positioned.fill(
        //   child: Image.asset(
        //     'assets/pngs/bg.jpeg',
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Container(
          margin: EdgeInsets.only(top: 12.h, right: 7.w, left: 7.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(children: [
                Text(
                  "Login ",
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
                    "Enter your login details",
                    style:
                        TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
              //   decoration: const BoxDecoration(
              //     border: Border(
              //         bottom: BorderSide(
              //             color: Colors.grey)), // Add a bottom border
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: const EdgeInsets.all(8.0),
              //         child: const Icon(Icons.mail),
              //       ),
              //       Container(
              //         width: 1.0,
              //         height: 24.0,
              //         color: Colors.grey,
              //         margin: const EdgeInsets.symmetric(vertical: 8.0),
              //       ),
              //       SizedBox(
              //         width: 1.w,
              //       ),
              //       Expanded(
              //         child: TextFormField(
              //           controller: controller.emailCtr,
              //           validator: (value) {
              //             if (value == null || value.isEmpty) {
              //               return 'Email is required';
              //             } else if (! controller. isEmailValid(value)) {
              //               return 'Please enter a valid email';
              //             }
              //             return null;
              //           },
              //           decoration: InputDecoration(
              //               hintText: 'Enter your Email',
              //               border: InputBorder.none),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              Obx(
                () {
                  return CustomTextField(
                    controller: controller.emailCtr,
                    hintText: 'Enter your Email',
                    onChanged: (val) {
                      controller.validateEmail(val);
                    },
                    prefixIcon: Icons.mail,
                    errorText: controller.emailModel.value.error,
                  );
                },
              ),

              SizedBox(
                height: 1.h,
              ),

              Obx(
                () {
                  return CustomTextField(
                    controller: controller.passCtr,
                    hintText: 'Enter your Password ',
                    onChanged: (val) {
                      controller.validatePassword(val);
                    },
                    // validator: controller.validatePassword(val),
                    prefixIcon: Icons.password_rounded,
                    errorText: controller.passModel.value.error,

                    suffixIcon: controller.obsecureText.value == true
                        ? Icons.visibility_off
                        : Icons.visibility,
                  );
                },
              ),

              // FadeInUp(
              //     from: 30,
              //     child: AnimatedSize(
              //         duration: const Duration(milliseconds: 300),
              //         child: Obx(() {
              //           return getReactiveFormField(
              //             node: controller.emailNode,
              //             controller: controller.emailCtr,
              //             hintLabel: "Enter Email",
              //             onChanged: (val) {
              //               controller.validateEmail(val);
              //             },
              //             errorText: controller.emailModel.value.error,
              //             inputType: TextInputType.text,
              //           );
              //         }))),
              // FadeInUp(
              //     from: 30,
              //     child: AnimatedSize(
              //         duration: const Duration(milliseconds: 300),
              //         child: Obx(() {
              //           return getReactiveFormField(
              //             node: controller.passNode,
              //             controller: controller.passCtr,
              //             hintLabel: "Enter Password",
              //             wantSuffix: true,
              //             isPassword: true,
              //             onChanged: (val) {
              //               controller.validatePassword(val);
              //             },
              //             fromObsecureText: "LOGIN",
              //             errorText: controller.passModel.value.error,
              //             inputType: TextInputType.text,
              //           );
              //         }))),

              SizedBox(
                height: 7.h,
              ),

              // GestureDetector(
              //   onTap: () {
              //     controller.signInAPI(context);
              //   },
              //   child: Container(
              //     height: 5.5.h,
              //     alignment: Alignment.center,
              //     //  padding: EdgeInsets.only(top: 1.h),
              //     width: SizerUtil.width / 1,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(2.h),
              //       color: primaryColor,
              //       boxShadow: [
              //         BoxShadow(
              //             color: primaryColor.withOpacity(0.2),
              //             blurRadius: 10.0,
              //             offset: const Offset(0, 1),
              //             spreadRadius: 3.0)
              //       ],
              //     ),
              //     child: Text(
              //       "Login",
              //       style: TextStyle(
              //           color: white, fontFamily: fontBold, fontSize: 12.sp),
              //     ),
              //   ),
              // ),

              FadeInUp(
                  from: 50,
                  child: Obx(() {
                    return getFormButton(() {
                      if (controller.isFormInvalidate.value == true) {
                        // Get.to(const HomeScreen());
                        controller.signInAPI(context);
                        logcat("LOGINSUCCESSFUL:::::", "");
                      }
                    }, "Sign In", validate: controller.isFormInvalidate.value);
                  })),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
