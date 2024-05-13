import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Common {
  // ignore: non_constant_identifier_names
  void Trasparent_statusbar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ));
  }
}
