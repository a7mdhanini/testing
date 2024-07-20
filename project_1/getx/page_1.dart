import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page_1_controller.dart';
import 'page_2.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    // Page1Controller controller = Get.put(Page1Controller());

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                'Name: ${Get.find<Page1Controller>().userModel.value.name}',
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),

            GetX(
              init: Page1Controller(),
              builder: (controller) {
                return Text(
                  'Number Is: ${controller.userModel.value.number}',
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              },
            ),

            // GetBuilder<Page1Controller>(
            //   init: Page1Controller(),
            //   builder: (crl) {
            //     return Column(
            //       children: [
            // Text(
            //   'Name: ' + crl.userModel.name,
            //   style:
            //       TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            // Text(
            //   'Number Is: ' + crl.userModel.number.toString(),
            //   style:
            //       TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            //       ],
            //     );
            //   },
            // ),
            // const SizedBox(height: 20),
            // GetBuilder<Page1Controller>(builder: (_) {
            //   return Text(
            //     'Number Is: ',
            //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            //   );
            // }),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Show Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.find<Page1Controller>().updateData(66, 'noor');
                // controller.increment();
              },
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const Page2(),
                    transition: Transition.fadeIn,
                    duration: const Duration(seconds: 3));
              },
              child: const Text('Go To Page 2'),
            ),
            const SizedBox(height: 20),

            ////dsfndjksnfkjdsnfkjnsdkjfsd
            ElevatedButton(
              onPressed: () {
                Get.snackbar('Helloo', 'welcome to my app');
              },
              child: const Text('show snackbar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (_) {
                    return AlertDialog(
                      content: SizedBox(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              color: Colors.amber,
                              width: 100,
                              height: 100,
                            ),
                            Container(
                              color: Colors.red,
                              width: 100,
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: const Text('Dialog'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  backgroundColor: Colors.black,
                  title: "Wrong Password !!",
                  titleStyle: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  middleText: "Password is Wrong ,",
                  middleTextStyle: const TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Montserrat",
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                  actions: [
                    // CustomMaterialButton(
                    //   height: 50,
                    //   width: 80,
                    //   textbutton: "back",
                    //   onpress: () {
                    //     Get.back();
                    //   },
                    // ),
                  ],
                );
              },
              child: const Text('Go To Page 2'),
            ),
          ],
        ),
      ),
    );
  }
}





//? Reactive {
//?   GetX(builder: builder)

//?   Obx(builder)

//? } 


//? Update {

//?   GetBuilder(builder: builder)

//? }