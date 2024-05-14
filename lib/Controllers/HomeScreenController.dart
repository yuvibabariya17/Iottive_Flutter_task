import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Api_handle/Repository.dart';
import 'package:iottive_flutter_task/Config/Api_call_constant.dart';
import 'package:iottive_flutter_task/Controllers/InternetController.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
import 'package:iottive_flutter_task/Core/Constant/String_Constant.dart';
import 'package:iottive_flutter_task/Dialogs/dialogs.dart';
import 'package:iottive_flutter_task/Models/HomeScreenModel.dart';
import 'package:iottive_flutter_task/Preference/Userpreference.dart';
import 'package:iottive_flutter_task/Utils/log.dart';

class HomeScreenController extends GetxController {
  final InternetController networkManager = Get.find<InternetController>();
  late FocusNode searchNode;
  late TextEditingController searchCtr;

  Rx<ScreenState> state = ScreenState.apiLoading.obs;

  List<HomeList> filteredHomeList = [];

  RxBool isHomeTypeApiList = false.obs;
  RxList<HomeList> homeObjectList = <HomeList>[].obs;

  @override
  void onInit() {
    searchNode = FocusNode();

    searchCtr = TextEditingController();
    super.onInit();
  }

  void filterHomeList(String query) {
    if (query.isEmpty) {
      filteredHomeList = homeObjectList;
    } else {
      List<HomeList> newArray = [];
      for (var element in homeObjectList) {
        bool isFound = false;
        for (var pd in element.product) {
          if (pd.productName
              .toString()
              .trim()
              .toLowerCase()
              .contains(query.toLowerCase())) {
            isFound = true;
          }
        }
        if (isFound) {
          newArray.add(element);
        }
      }

      filteredHomeList = newArray;
    }
    update();
  }

  void getHomeList(context) async {
    state.value = ScreenState.apiLoading;
    try {
      String token = await UserPreferences().getToken();
      var data = await UserPreferences().getSignInInfo();

      var response = await Repository.postForm(
          {"authToken": token, "userId": data?.userId.toString()}, ApiUrl.home,
          allowHeader: true);
      isHomeTypeApiList.value = false;
      var responseData = jsonDecode(response.body);
      update();

      logcat("HOMERESPONSE", jsonEncode(responseData));
      if (response.statusCode == 200) {
        var data = HomeScreenModel.fromJson(responseData);
        if (data.success == true) {
          state.value = ScreenState.apiSuccess;
          homeObjectList.clear();
          homeObjectList.addAll(data.data);
          filteredHomeList = homeObjectList;

          update();

          logcat("HOME RESPONSE", jsonEncode(homeObjectList));
        } else {
          showDialogForScreen(context, responseData['message'],
              callback: () {});
        }
      } else {
        showDialogForScreen(context, "Server Error", callback: () {});
      }
    } catch (e) {
      logcat('Exception', e);
      isHomeTypeApiList.value = false;
    }
    update();
  }

  showDialogForScreen(context, String message, {Function? callback}) {
    showMessage(
        context: context,
        callback: () {
          if (callback != null) {
            callback();
          }
          return true;
        },
        message: message,
        title: Strings.homeTitle,
        negativeButton: '',
        positiveButton: Strings.continueBtn);
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
