import 'package:flutter/material.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_container.dart';
import 'package:testing/constants/app_sizes.dart';
import 'package:testing/pages/orders_page/show_order_page.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'My Orders',
        ),
      ),

      body: ListView.builder(
        itemCount: 10,
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
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXJA32WU4rBpx7maglqeEtt3ot1tPIRWptxA&s',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'Title wlkedmw ewd kl wedekl wdwkled w ewjkdf ',
                    overflow: TextOverflow.fade,
                    style: TextStyle(
                      fontSize: Sizes.allSizes(context) / 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
