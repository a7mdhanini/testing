import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_loading.dart';
import 'package:testing/constants/app_strings.dart';
import 'package:testing/controllers/auth_crl/auth_crl.dart';
import 'package:testing/models/auth_models/user_model.dart';
import 'package:testing/pages/admin_pages/admin_page.dart';
import 'package:testing/pages/auth_pages/login_page.dart';
import 'package:testing/pages/nav_pages/navigation_page.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapShot) {
        return GetBuilder<AuthCrl>(
          builder: (authCrl) {
            switch (snapShot.connectionState) {
              case ConnectionState.waiting:
                return const MyLoading();

              case ConnectionState.none:
                return const MyLoading();

              case ConnectionState.active:
                if (snapShot.hasData) {
                  return StreamBuilder<dynamic>(
                    stream: FirebaseFirestore.instance
                        .collection(AppStrings.users)
                        .doc(FirebaseAuth.instance.currentUser!.uid)
                        .snapshots(),
                    builder: (context, userSnapshot) {
                      if (userSnapshot.hasData) {
                        if (userSnapshot.data.data() == null ||
                            userSnapshot.data == null) {
                          return const LoginPage();
                        } else {
                          authCrl.userModel =
                              UserModel.fromJson(userSnapshot.data.data());

                          if (authCrl.userModel.isAdmin) {
                            return const AdminPage();
                          } else {
                            return const NavigationPage();
                          }
                        }
                      } else {
                        return const MyLoading();
                      }
                    },
                  );
                } else {
                  return const LoginPage();
                }

              default:
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
