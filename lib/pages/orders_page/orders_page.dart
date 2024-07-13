import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_container.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/controllers/orders_crl/orders_crl.dart';
import 'package:testing/pages/orders_page/show_order_page.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Get.find<OrdersCrl>().fetchOrders(),
      builder: (context, snapshot) {
        return GetBuilder<OrdersCrl>(
          init: OrdersCrl(),
          builder: (crl) {
            return Scaffold(
              ///---AppBar
              appBar: const PreferredSize(
                preferredSize: Size.fromHeight(56),
                child: MyAppBar(
                  title: 'My Orders',
                ),
              ),

              body: ListView.builder(
                itemCount: crl.ordersList.length,
                itemBuilder: (context, index) {
                  return MyContainer(
                    onTap: () {
                      Route route = MaterialPageRoute(
                        builder: (_) => ShowOrderPage(
                          itemId: index.toString(),
                        ),
                      );

                      Navigator.push(context, route);
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                            child: Image.network(
                              crl.ordersList[index].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              crl.ordersList[index].title,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: Sizes.allSizes(context) / 80,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              crl.ordersList[index].orderTime,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontSize: Sizes.allSizes(context) / 80,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
