import 'package:flutter/material.dart';
import 'package:testing/components/languages_dialog.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_settings_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Settings',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MySettingsButton(
              onTap: () {
                languagesDialog(context);
              },
              title: 'Languages',
              icon: Icons.language,
            ),
            const SizedBox(height: 30),
            MySettingsButton(
              onTap: () {},
              title: 'Contact Us',
              icon: Icons.contact_support_rounded,
            ),
            const SizedBox(height: 30),
            MySettingsButton(
              onTap: () {},
              title: 'Sign Out',
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
