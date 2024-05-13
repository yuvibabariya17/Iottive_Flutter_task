import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Api_handle/Repository.dart';
import 'package:iottive_flutter_task/Config/Api_call_constant.dart';
import 'package:iottive_flutter_task/Controllers/InternetController.dart';
import 'package:iottive_flutter_task/Controllers/LoginScreenController.dart';
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

  // List<TransactionItem> staticData = transactionitem;
  RxBool isServiceTypeApiList = false.obs;
  RxList<HomeList> serviceObjectList = <HomeList>[].obs;

  @override
  void onInit() {
    searchNode = FocusNode();

    searchCtr = TextEditingController();
    super.onInit();
  }

  void filterServiceList(String query) {
    print("SEarch ${query} ");
    if (query.isEmpty) {
      filteredHomeList = serviceObjectList;
    } else {
      List<HomeList> newArray = [];
      serviceObjectList.forEach((element) {
        bool isFound = false;
        element.product.forEach((pd) {
          if (pd.productName
              .toString()
              .trim()
              .toLowerCase()
              .contains(query.toLowerCase())) {
            isFound = true;
          }
        });
        if (isFound) {
          newArray.add(element);
        }
      });

      filteredHomeList = newArray;
    }
    update();
  }

  void getServiceList(context) async {
    state.value = ScreenState.apiLoading;
    // isServiceTypeApiList.value = true;
    try {
      if (networkManager.connectionType == 0) {
        showDialogForScreen(context, "No Internet Connection", callback: () {
          Get.back();
        });
        return;
      }
      String token = await UserPreferences().getToken();
      var data = await UserPreferences().getSignInInfo();

      var response = await Repository.postForm(
          {"authToken": token, "userId": data?.userId.toString()}, ApiUrl.home,
          allowHeader: true);
      isServiceTypeApiList.value = false;
      var responseData = jsonDecode(response.body);
      update();

      logcat("SERVICERESPONSE", jsonEncode(responseData));
      if (response.statusCode == 200) {
        var data = HomeScreenModel.fromJson(responseData);
        if (data.success == true) {
          state.value = ScreenState.apiSuccess;
          serviceObjectList.clear();
          serviceObjectList.addAll(data.data);
          filteredHomeList = serviceObjectList;

          update();

          logcat("SERVICE RESPONSE", jsonEncode(serviceObjectList));
        } else {
          showDialogForScreen(context, responseData['message'],
              callback: () {});
        }
      } else {
        showDialogForScreen(context, "Server Error", callback: () {});
      }
    } catch (e) {
      logcat('Exception', e);
      isServiceTypeApiList.value = false;
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
        title: "Home Screen",
        negativeButton: '',
        positiveButton: "Continue");
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
