import 'package:flutter/material.dart';
import 'package:testing/components/languages_dialog.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_settings_button.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/constants/app_sizes.dart';

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
            SizedBox(
              height: Sizes.width(context) / 3,
              width: Sizes.width(context) / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXJA32WU4rBpx7maglqeEtt3ot1tPIRWptxA&s',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              'Name Of User',
              style: TextStyle(
                color: AppColors.black,
                fontSize: Sizes.allSizes(context) / 75,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 100),
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
