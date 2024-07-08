import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_aleart_dialog.dart';
import 'package:testing/models/auth_models/user_model.dart';
import 'package:testing/pages/nav_pages/navigation_page.dart';

class AuthCrl extends GetxController {
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  ///----User Model
  UserModel userModel = UserModel(
    id: '',
    email: '',
    password: '',
    name: '',
    cPassword: '',
    isAdmin: false,
  );

  void setEmail(String newVal) {
    userModel.email = newVal;
    update();
  }

  void setName(String newVal) {
    userModel.name = newVal;
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
      name: '',
      cPassword: '',
      isAdmin: false,
    );

    update();
  }

  Future<void> signUp(BuildContext context) async {
    FocusScope.of(context).unfocus();
    signupFormKey.currentState!.save();

    final bool isValid = signupFormKey.currentState!.validate();

    try {
      if (!userModel.email.isEmail) {
        myAleartDialog(context, text: 'Please enter a valid email');
      } else if (userModel.name.isEmpty) {
        myAleartDialog(context, text: 'Please enter your name');
      } else if (userModel.password.length <= 8 &&
          userModel.cPassword.length <= 8) {
        myAleartDialog(context, text: 'Password must be 8 characters at least');
      } else if (userModel.password != userModel.cPassword) {
        myAleartDialog(context, text: 'Passwords do not match');
      } else if (isValid) {
        setIsLoading(true);
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password,
        )
            .then((UserCredential userCedential) {
          userModel.id = userCedential.user!.uid;

          DocumentReference ref = FirebaseFirestore.instance
              .collection('users')
              .doc(userCedential.user!.uid);

          ref.set(userModel.toMap()).then((val) {
            log('OK');
          });

          setIsLoading(false);
        });
      }
    } on FirebaseAuthException catch (e) {
      setIsLoading(false);
      log(e.toString());

      if (e.code == 'weak-password') {
        myAleartDialog(context, text: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        myAleartDialog(context,
            text: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        myAleartDialog(context, text: 'The email address is badly formatted.');
      } else {
        log(e.toString());
      }
    }
  }

  Future<void> logIn(BuildContext context) async {
    FocusScope.of(context).unfocus();
    loginFormKey.currentState!.save();

    final bool isValid = loginFormKey.currentState!.validate();

    try {
      if (!userModel.email.isEmail) {
        myAleartDialog(context, text: 'Please enter a valid email');
      } else if (userModel.password.length <= 8) {
        myAleartDialog(context,
            text: 'Passwords must be 8 characters at least');
      } else if (isValid) {
        setIsLoading(true);

        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
          email: userModel.email,
          password: userModel.password,
        )
            .then((UserCredential userCedential) {
          Route route =
              MaterialPageRoute(builder: (_) => const NavigationPage());

          Navigator.pushReplacement(context, route);

          setIsLoading(false);
        });
      }
    } on FirebaseAuthException catch (e) {
      myAleartDialog(context, text: e.toString());
      setIsLoading(false);
      log(e.toString());

      if (e.code == 'weak-password') {
        myAleartDialog(context, text: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        myAleartDialog(context,
            text: 'The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        myAleartDialog(context, text: 'The email address is badly formatted.');
      } else {
        log(e.toString());
      }
    }
  }

  Future<void> signOut() async {}
}
