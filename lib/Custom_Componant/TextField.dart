import 'package:flutter/material.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:sizer/sizer.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String?)? onChanged;
  final String hintText;
  final IconData? prefixIcon;
  final String? errorText;
  final IconData? suffixIcon;
  final bool isPassword;
  final String? Function(String?)? validator; // New property for validation

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.errorText,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
    this.validator, // Initialize the validator
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 1.w, right: 1.w),
          //padding: EdgeInsets.symmetric(horizontal: 16.0),
          decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey)),
          ),
          child: Row(
            children: [
              if (widget.prefixIcon != null)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    widget.prefixIcon,
                    color: primaryColor,
                  ),
                ),
              SizedBox(
                width: 3.w,
              ),
              // if (widget.prefixIcon != null)
              //   Container(
              //     width: 3.0,
              //     height: 24.0,
              //     color: Colors.grey,
              //     margin: const EdgeInsets.symmetric(vertical: 8.0),
              //   ),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  cursorColor: black,
                  cursorHeight: 30,
                  obscureText: widget.suffixIcon == Icons.visibility_off
                      ? _obscureText
                      : false,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    hintStyle: TextStyle(
                      color: black.withOpacity(0.5),
                    ),
                    border: InputBorder.none,
                    errorText: widget.errorText,
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Icon(
                        widget.suffixIcon,
                        color: primaryColor,
                      ),
                    ),
                  ),
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                ),
              ),
              // if (widget.suffixIcon != null)
              //   Container(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Icon(widget.suffixIcon),
              //   ),
            ],
          ),
        ),
        // if (widget.validator != null)
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 16.0),
        //     child: Text(
        //       widget.validator!(widget.controller.text) ?? '',
        //       style: const TextStyle(color: Colors.red),
        //     ),
        //   ),
      ],
    );
  }
}
