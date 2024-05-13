import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
import 'package:iottive_flutter_task/Core/Themes/Color_constant.dart';
import 'package:iottive_flutter_task/Core/Themes/Style.dart';
import 'package:iottive_flutter_task/Core/Themes/font_constant.dart';
import 'package:sizer/sizer.dart';

class CustomFormField extends StatefulWidget {
  CustomFormField(
      {Key? key,
      required this.hintText,
      required this.errorText,
      this.onChanged,
      this.validator,
      this.title,
      this.inputFormatters,
      required this.inputType,
      required this.node,
      this.controller,
      this.wantPrefix,
      this.isExpand,
      this.isVerified,
      this.time,
      this.isPhoto,
      this.isDropdown,
      this.onAddBtn,
      this.isCalender,
      this.isHidden,
      this.isHr,
      this.wantSuffix,
      this.onVerifiyButtonClick,
      this.isDataValidated,
      this.onTap,
      this.isdown,
      this.isReadOnly,
      this.isPrefixPass,
      this.isPick,
      this.isAdd,
      this.isPassword,
      this.fromObsecureText,
      this.index,
      this.isFromAddStory = false,
      this.isEnable = true})
      : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final bool? wantPrefix;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? title;
  final FocusNode node;
  final Function(String?)? onChanged;
  final bool? isExpand;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool? isVerified;
  final bool? isPick;
  final bool? time;
  final bool? isDropdown;
  final Function? onAddBtn;
  final bool? isReadOnly;
  final bool? isPhoto;
  final bool? isPassword;
  final bool? isCalender;
  final Function? onVerifiyButtonClick;
  final bool? wantSuffix;
  final bool? isHidden;
  final bool? isDataValidated;
  final bool? isAdd;
  final bool? isdown;
  final bool? isHr;
  final bool? isPrefixPass;
  final String? fromObsecureText;
  final Function? onTap;
  bool isEnable = true;
  final String? index;
  bool isFromAddStory = false;
  bool obsecuretext = false;

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.isExpand! ? 4 : 1,
      enabled: widget.isEnable,
      cursorColor: primaryColor,
      readOnly:
          widget.isCalender == true || widget.isReadOnly == true ? true : false,
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      obscureText: widget.fromObsecureText == "LOGIN"
          ? Get.find<LoginScreenController>().obsecureText.value
          : widget.obsecuretext,
      textInputAction: TextInputAction.next,
      keyboardType: widget.inputType,
      validator: widget.validator,
      controller: widget.controller,
      maxLength: widget.inputType == TextInputType.number ? 16 : null,
      style: widget.isFromAddStory
          ? TextStyle(
              fontFamily: fontRegular,
              fontSize:
                  SizerUtil.deviceType == DeviceType.mobile ? 12.sp : 8.sp,
              color: black)
          : styleTextFormFieldText(),
      textAlignVertical: TextAlignVertical.center,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        labelStyle: styleTextForFieldLabel(widget.node),
        contentPadding: EdgeInsets.only(
            left: SizerUtil.deviceType == DeviceType.mobile ? 5.w : 4.w,
            right: SizerUtil.deviceType == DeviceType.mobile ? 5.w : 4.w,
            top: SizerUtil.deviceType == DeviceType.mobile
                ? widget.isExpand!
                    ? 5.h
                    : 0.w
                : 3.w,
            bottom: SizerUtil.deviceType == DeviceType.mobile ? 0.w : 2.w),
        //EdgeInsets.symmetric(vertical: 1.8.h, horizontal: 5.w),
        hintText: widget.hintText,
        errorText: widget.errorText,
        errorStyle: styleTextForErrorFieldHint(),
        hintStyle: styleTextForFieldHint(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: inputBorderColor,
            width: 1.5,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent, width: 1.2),
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
        ),
        counterText: '',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: inputBorderColor,
          ),
        ),
        // prefixStyle: styleTextFormFieldText(),
        // prefixIcon: widget.wantPrefix == true
        //     ? Icon(Icons.mail)
        //     : widget.isPrefixPass == true
        //         ? Icon(Icons.password_rounded)
        //         : Container(),
        // prefixIconConstraints:
        //     const BoxConstraints(minHeight: 25, maxHeight: 50),
        suffixIcon: widget.wantSuffix == true
            ? GestureDetector(
                onTap: () {
                  if (widget.fromObsecureText == "LOGIN") {
                    Get.find<LoginScreenController>().obsecureText.value =
                        !Get.find<LoginScreenController>().obsecureText.value;
                    setState(() {});
                  } else {
                    _togglePasswordView(context);
                  }
                },
                child: widget.time == true
                    ? GestureDetector(
                        onTap: () {
                          if (widget.onTap != null) widget.onTap!();
                        },
                        // child: Padding(
                        //   padding: SizerUtil.deviceType == DeviceType.mobile
                        //       ? EdgeInsets.all(4.w)
                        //       : EdgeInsets.only(right: 3.w),
                        //   child: SvgPicture.asset(Asset.time,
                        //       height: SizerUtil.deviceType == DeviceType.mobile
                        //           ? 0
                        //           : 10,
                        //       width: SizerUtil.deviceType == DeviceType.mobile
                        //           ? 0
                        //           : 10,
                        //       fit: BoxFit.contain),
                        // ),
                      )
                    : widget.isCalender == true
                        ? GestureDetector(
                            onTap: () {
                              if (widget.onTap != null) widget.onTap!();
                            },
                            // child: Padding(
                            //   padding: SizerUtil.deviceType ==
                            //           DeviceType.mobile
                            //       ? EdgeInsets.all(4.w)
                            //       : EdgeInsets.only(right: 3.w),
                            //   child: SvgPicture.asset(
                            //     Asset.calender,
                            //     height: SizerUtil.deviceType ==
                            //             DeviceType.mobile
                            //         ? 0
                            //         : 8,
                            //     width: SizerUtil.deviceType ==
                            //             DeviceType.mobile
                            //         ? 0
                            //         : 8,
                            //     fit: BoxFit.contain,
                            //     color: Colors.grey,
                            //   ),
                            // ),
                          )
                        : InkWell(
                            child: widget.isPassword == true
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        right: SizerUtil.deviceType ==
                                                DeviceType.mobile
                                            ? 0.w
                                            : 3.w),
                                    child: Icon(
                                      widget.fromObsecureText == "LOGIN"
                                          ? Get.find<LoginScreenController>()
                                                  .obsecureText
                                                  .value
                                              ? Icons.visibility_off
                                              : Icons.visibility
                                          : widget.obsecuretext
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                      color: Colors.grey,
                                      size: SizerUtil.deviceType ==
                                              DeviceType.mobile
                                          ? 20.sp
                                          : 15.sp,
                                    ),
                                  )
                                : widget.isdown == true
                                    ? GestureDetector(
                                        onTap: () {
                                          if (widget.onTap != null)
                                            widget.onTap!();
                                        },
                                        // child: Padding(
                                        //   padding: EdgeInsets.only(
                                        //       right: SizerUtil
                                        //                   .deviceType ==
                                        //               DeviceType.mobile
                                        //           ? 0.w
                                        //           : 3.w),
                                        //   child: SvgPicture.asset(
                                        //     Asset.dropdown,
                                        //     height: 20,
                                        //     width: 20,
                                        //     fit: BoxFit.scaleDown,
                                        //   ),
                                        //   // child: Icon(
                                        //   //   Icons
                                        //   //       .keyboard_arrow_down_rounded,
                                        //   //   size: SizerUtil.deviceType ==
                                        //   //           DeviceType.mobile
                                        //   //       ? 30
                                        //   //       : 40,
                                        //   //   color: Colors.black
                                        //   //       .withOpacity(0.2),
                                        //   // ),
                                        // ),
                                      )
                                    : widget.isPhoto == true
                                        ? GestureDetector(
                                            onTap: () {
                                              if (widget.onTap != null)
                                                widget.onTap!();
                                            },
                                            child: Padding(
                                              padding: SizerUtil.deviceType ==
                                                      DeviceType.mobile
                                                  ? EdgeInsets.all(4.w)
                                                  : EdgeInsets.only(right: 3.w),
                                              // child: SvgPicture.asset(
                                              //     Asset.photos,
                                              //     height: SizerUtil
                                              //                 .deviceType ==
                                              //             DeviceType
                                              //                 .mobile
                                              //         ? 8
                                              //         : 8,
                                              //     width: SizerUtil
                                              //                 .deviceType ==
                                              //             DeviceType
                                              //                 .mobile
                                              //         ? 8
                                              //         : 8,
                                              //     fit: BoxFit.contain),
                                            ),
                                          )
                                        : Container()))
            : Container(
                width: 1,
              ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              SizerUtil.deviceType == DeviceType.mobile ? 30 : 50),
          borderSide: const BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
    );
  }

  void _togglePasswordView(BuildContext context) {
    setState(() {
      widget.obsecuretext = !widget.obsecuretext;
    });
  }
}
