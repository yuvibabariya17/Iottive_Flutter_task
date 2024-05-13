import 'package:flutter/material.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';

class CustomScrollbar extends StatelessWidget {
  final double thickness;
  final Radius radius;
  final Color color;
  final Widget child;

  const CustomScrollbar({
    Key? key,
    required this.thickness,
    required this.radius,
    required this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: thickness,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.horizontal(left: radius),
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: thickness,
            decoration: BoxDecoration(
              color: black,
              borderRadius: BorderRadius.horizontal(right: radius),
            ),
          ),
        ),
      ],
    );
  }
}
