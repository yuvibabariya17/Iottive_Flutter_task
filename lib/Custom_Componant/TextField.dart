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
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.errorText,
    this.suffixIcon,
    this.isPassword = false,
    this.onChanged,
    this.validator,
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
            ],
          ),
        ),
      ],
    );
  }
}
