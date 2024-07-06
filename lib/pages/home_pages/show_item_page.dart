import 'package:flutter/material.dart';
import 'package:testing/components/my_app_bar.dart';
import 'package:testing/components/my_button.dart';
import 'package:testing/constants/app_sizes.dart';

class ShowItemPage extends StatelessWidget {
  final String itemId;

  const ShowItemPage({required this.itemId, super.key});

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
                  'Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf Title wlkedmw ewd kl wedekl wdwkled w ewjkdf ',
                  style: TextStyle(
                    fontSize: Sizes.allSizes(context) / 90,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            MyButton(title: 'Order Item', onPressed: () {}),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
