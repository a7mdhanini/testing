import 'package:flutter/material.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/constants/app_sizes.dart';

class ShowOrderPage extends StatelessWidget {
  final String itemId;

  const ShowOrderPage({required this.itemId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///---AppBar
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          title: 'Item ' + itemId,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Sizes.height(context) / 2.5,
              width: Sizes.width(context),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXJA32WU4rBpx7maglqeEtt3ot1tPIRWptxA&s',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 50,
                width: Sizes.width(context),
                child: Text(
                  'Title wlkedmw ewd kl wedekl wdwkled w ewjkdf ',
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Text(
                  ' df Title wlkedmw ewd kl wedekl wdwkled w ewjkdf ',
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 90,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Row(
                  children: [
                    Text(
                      'Price: ',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '22\$',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Row(
                  children: [
                    Text(
                      'Quantity: ',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '3',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Row(
                  children: [
                    Text(
                      'Order Date: ',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '12/2/1997',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Row(
                  children: [
                    Text(
                      'Status: ',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'On The Way',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Row(
                  children: [
                    Text(
                      'Payment: ',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Cash',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                // height: 50,
                width: Sizes.width(context),
                child: Row(
                  children: [
                    Text(
                      'Delivery time: ',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '2/2/2026',
                      style: TextStyle(
                        fontSize: Sizes.allSizes(context) / 90,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
