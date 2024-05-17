import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Controllers/InternetController.dart';
import 'package:iottive_flutter_task/Core/Common/Common.dart';
import 'package:iottive_flutter_task/Core/Themes/color_constant.dart';
import 'package:iottive_flutter_task/Views/SplashScreen/SplashScreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  //Get.lazyPut(() => InternetController());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final intenetController = Get.put(InternetController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<InternetController>(() => InternetController());
    Common().Trasparent_statusbar();
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Iottive',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(primaryColor),
            trackColor: MaterialStateProperty.all(white),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.3),
            ),
            child: child!,
          );
        },
      );
    });
  }
}
