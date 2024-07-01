import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/models/auth_models/user_model.dart';

class AuthCrl extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///----User Model
  UserModel userModel = UserModel(
    id: '',
    email: '',
    password: '',
    cPassword: '',
  );

  void setEmail(String newVal) {
    userModel.email = newVal;
    update();
  }

  void setPassword(String newVal) {
    userModel.password = newVal;
    update();
  }

  void setCPassword(String newVal) {
    userModel.cPassword = newVal;
    update();
  }

  bool isLoading = false;
  void setIsLoading(bool newVal) {
    isLoading = newVal;
    update();
  }

  bool isVisable = false;
  void setIsVisable() {
    isVisable = !isVisable;
    update();
  }

  void clearData() {
    userModel = UserModel(
      id: '',
      email: '',
      password: '',
      cPassword: '',
    );

    update();
  }

  Future<void> logIn(BuildContext context) async {
    // FocusScope.of(context).unfocus();
    // loginFormKey.currentState!.save();

    // final isValid = loginFormKey.currentState!.validate();

    // if (isValid) {
    //   log('Ok');
    // } else {
    //   log('Error');
    // }
  }

  Future<void> signUp() async {}

  Future<void> signOut() async {}
}
