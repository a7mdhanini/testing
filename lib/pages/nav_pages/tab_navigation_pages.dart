import 'package:flutter/material.dart';
import 'package:testing/pages/home_pages/home_page.dart';
import 'package:testing/pages/orders_page/orders_page.dart';
import 'package:testing/pages/settings_pages/settings_page.dart';

class TabNavigationPages extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String tabItem;

  const TabNavigationPages({
    super.key,
    required this.navigatorKey,
    required this.tabItem,
  });

  @override
  Widget build(BuildContext context) {
    Widget? child;

    if (tabItem == "Page1") {
      child = const HomePage();
    } else if (tabItem == "Page2") {
      child = const OrdersPage();
    } else if (tabItem == "Page3") {
      child = const SettingsPage();
    } else {
      child = const HomePage();
    }

    return Navigator(
      key: navigatorKey,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(builder: (_) => child!);
      },
    );
  }
}
