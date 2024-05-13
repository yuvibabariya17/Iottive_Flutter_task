import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iottive_flutter_task/Api_handle/Repository.dart';
import 'package:iottive_flutter_task/Config/Api_call_constant.dart';
import 'package:iottive_flutter_task/Controllers/InternetController.dart';
import 'package:iottive_flutter_task/Dialogs/LoadingIndicator.dart';
import 'package:iottive_flutter_task/Dialogs/dialogs.dart';
import 'package:iottive_flutter_task/Models/SignInModel.dart';
import 'package:iottive_flutter_task/Models/ValidationModel.dart';
import 'package:iottive_flutter_task/Preference/Userpreference.dart';
import 'package:iottive_flutter_task/Utils/log.dart';
import 'package:iottive_flutter_task/Views/Home/HomeScreen.dart';

enum ScreenState { apiLoading, apiError, apiSuccess, noNetwork, noDataFound }

class LoginScreenController extends GetxController {
  RxBool obsecureText = true.obs;

  final InternetController networkManager = Get.find<InternetController>();
  late FocusNode emailNode, passNode;
  late TextEditingController emailCtr, passCtr;

  Rx<ScreenState> state = ScreenState.apiLoading.obs;

  @override
  void onInit() {
    emailNode = FocusNode();
    passNode = FocusNode();

    emailCtr = TextEditingController();
    passCtr = TextEditingController();

    super.onInit();
  }

  var isLoading = false.obs;
  var emailModel = ValidationModel(null, null, isValidate: false).obs;
  var passModel = ValidationModel(null, null, isValidate: false).obs;

  void enableSignUpButton() {
    if (emailModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else if (passModel.value.isValidate == false) {
      isFormInvalidate.value = false;
    } else {
      isFormInvalidate.value = true;
    }
  }

  void validateEmail(String? val) {
    emailModel.update((model) {
      if (val != null && val.toString().trim().isEmpty) {
        model!.error = "Enter Email Id";
        model.isValidate = false;
      } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(emailCtr.text.trim())) {
        model!.error = "Enter Valid Email Id";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });

    enableSignUpButton();
  }

  void validatePassword(String? val) {
    passModel.update((model) {
      if (val == null || val.toString().trim().isEmpty) {
        model!.error = "Enter Password";
        model.isValidate = false;
      } else if (val.length < 8) {
        model!.error = "Enter Valid Password";
        model.isValidate = false;
      } else {
        model!.error = null;
        model.isValidate = true;
      }
    });
    enableSignUpButton();
  }

  RxBool isFormInvalidate = false.obs;

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void signInAPI(context) async {
    var loadingIndicator = LoadingProgressDialog();
    try {
      if (networkManager.connectionType == 0) {
        loadingIndicator.hide(context);
        showDialogForScreen(context, "No Internet Connection", callback: () {
          Get.back();
        });
        return;
      }
      loadingIndicator.show(context, '');
      var response = await Repository.postForm({
        "email": emailCtr.text.toString(),
        "password": passCtr.text.toString(),
      }, ApiUrl.login, allowHeader: true);
      loadingIndicator.hide(context);
      var data = jsonDecode(response.body);
      logcat("RESPOnse", data);
      if (response.statusCode == 200) {
        var responseDetail = SignInModel.fromJson(data);
        if (responseDetail.success == true) {
          UserPreferences().saveSignInInfo(responseDetail);
          UserPreferences().setToken(responseDetail.authToken.toString());
          Get.to(const HomeScreen());
        } else {
          showDialogForScreen(context, data['message'].toString(),
              callback: () {});
        }
      } else {
        state.value = ScreenState.apiError;
        showDialogForScreen(context, data['message'].toString(),
            callback: () {});
      }
    } catch (e) {
      logcat("Exception", e);
      showDialogForScreen(context, "Server Error", callback: () {});
      loadingIndicator.hide(context);
    }
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
        title: "Sign In",
        negativeButton: '',
        positiveButton: "Continue");
  }
}
