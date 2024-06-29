import 'dart:developer';

import 'package:flutter/material.dart';

class EmailPage extends StatefulWidget {
  final int number;
  const EmailPage({super.key, required this.number});

  @override
  State<EmailPage> createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  TextEditingController nameCrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_sharp),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Text(
                widget.number.toString(),
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),

              Text(
                'Welcome',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'You can send us an email using this page',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),

              ///----Text Field
              TextField(
                // obscureText: true,
                maxLines: 10,
                minLines: 10,
                controller: nameCrl,
                onChanged: (newVal) {
                  print(newVal);
                },
                // readOnly: true,

                decoration: InputDecoration(
                  hintText: 'Name',
                  hintStyle: TextStyle(color: Colors.amber),
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                    ),
                  ),
                  icon: Icon(Icons.mobile_friendly),
                  suffixIcon: Icon(Icons.abc),
                  prefixIcon: Icon(Icons.scatter_plot),
                  focusedBorder: UnderlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
              ),

              SizedBox(height: 30),

              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                  ),
                  // hintText: 'Phone',
                  label: Text('Phone'),
                ),
              ),

              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  log(nameCrl.text);
                },
                child: Text('Print'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
