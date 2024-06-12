import 'package:flutter/material.dart';
import 'package:testing/email_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      ///---AppBar
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Home Page'),
        titleSpacing: 1,
        centerTitle: true,
        elevation: 100,
        actions: [
          IconButton(
            icon: const Icon(Icons.phone, color: Colors.red),
            onPressed: () {
              print('call');
            },
          ),
          IconButton(
            icon: const Icon(Icons.email, color: Colors.red),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (_) => const EmailPage());
              Navigator.push(context, route);
            },
          ),
        ],
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.red),
        //   onPressed: () {
        //     print('print somthing!');
        //   },
        // ),
      ),

      ///----Body
      body: Column(
        children: [
          Text('Numbers List'),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.8,
                // crossAxisSpacing: 10.0,
                // mainAxisSpacing: 5,
              ),
              itemCount: 15,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(2),
                  color: index.isOdd ? Colors.red : Colors.blue,
                  // width: 100,
                  // height: 100,
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Row2 extends StatelessWidget {
  const Row2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ///----1
        Expanded(
          child: Container(
            color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Container 1'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ok 1'),
                ),
              ],
            ),
          ),
        ),

        ///----2
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Container 2'),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('ok 2'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RowW extends StatelessWidget {
  const RowW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'name : a7md',
            style: TextStyle(color: Colors.red),
          ),
          const Text(
            'age : 30',
            style: TextStyle(color: Colors.blue),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }
}

class ColumnW extends StatelessWidget {
  const ColumnW({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'name : a7md',
            style: TextStyle(color: Colors.red),
          ),
          const Text(
            'phone : 07987454321',
            style: TextStyle(color: Colors.purple),
          ),
          const Text(
            'age : 30',
            style: TextStyle(color: Colors.blue),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('ok'),
          ),
        ],
      ),
    );
  }
}
