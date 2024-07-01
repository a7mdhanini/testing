import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/constants/app_colors.dart';
import 'package:testing/controllers/nav_crl/navigation_crl.dart';
import 'package:testing/pages/nav_pages/tab_navigation_pages.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavigationCrl>(
      init: NavigationCrl(),
      builder: (nvgCrl) {
        return Scaffold(
          body: Stack(
            children: [
              _buildOffStageNavigator(nvgCrl, "Page1"),
              _buildOffStageNavigator(nvgCrl, "Page2"),
              _buildOffStageNavigator(nvgCrl, "Page3"),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.red,
            // buttonBackgroundColor: AppColors.orange,
            color: AppColors.white,
            animationCurve: Curves.linear,
            // animationDuration: const Duration(seconds: 1),
            items: const [
              Icon(Icons.home, size: 30),
              Icon(Icons.search, size: 30),
              Icon(Icons.settings, size: 30),
            ],

            index: nvgCrl.selectedIndex,

            onTap: (index) {
              nvgCrl.selectTap(nvgCrl.pageKeysList[index], index);
            },
          ),
        );
      },
    );
  }

  Widget _buildOffStageNavigator(NavigationCrl nvgCrl, String tabItem) {
    return Offstage(
      offstage: nvgCrl.currentPage != tabItem,
      child: TabNavigationPages(
        navigatorKey: nvgCrl.navigationKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}

//  Stack(
//             // alignment: AlignmentDirectional.topCenter,
//             children: [
//               Container(
//                 padding: EdgeInsets.only(),
//                 width: Sizes.width(context) / 1.5,
//                 height: Sizes.width(context) / 1.5,
//                 color: Colors.pink,
//               ),

//               Positioned(
//                 child: Container(
//                   width: Sizes.width(context) / 2,
//                   height: Sizes.width(context) / 2,
//                   color: Colors.amber,
//                 ),
//               ),

//               Container(
//                 width: 100,
//                 height: 100,
//                 color: Colors.red,
//               ),
//               // Container(
//               //   width: 50,
//               //   height: 50,
//               //   color: Colors.purple,
//               // ),
//             ],
//           )
