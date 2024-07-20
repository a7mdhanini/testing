import 'package:flutter/material.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/pages/conatact_us_pages/map_page.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

class ConatactUsPage extends StatelessWidget {
  const ConatactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Conatct Us',
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyButton(
              title: 'Email',
              onPressed: () {
                Uri uri = Uri.parse('mailto:a.h@gmail.com');
                launchUrl(uri);
              },
            ),
            MyButton(
              title: 'Phone Number',
              onPressed: () {
                Uri uri = Uri.parse('tel:009620000000000');
                launchUrl(uri);
              },
            ),
            MyButton(
              title: 'Map',
              onPressed: () {
                Route route =
                    MaterialPageRoute(builder: (_) => const MapPage());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
      ),
    );
  }
}
