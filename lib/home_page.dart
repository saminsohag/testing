import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> names = ["sohag", "sohan"];
  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.black,
    Colors.yellow,
    Colors.teal,
    Colors.cyan
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: names.length,
          //     itemBuilder: (cintext, index) {
          //       return Card(
          //         child: ListTile(title: Text(names[index])),
          //       );
          //     },
          //   ),
          // )
          // Expanded(
          //   child: GridView.count(
          //     crossAxisCount: 3,
          //     mainAxisSpacing: 5,
          //     crossAxisSpacing: 10,
          //     padding: const EdgeInsets.all(10),
          //     children: [
          //       Container(
          //         color: Colors.red,
          //       ),
          //       Container(
          //         color: Colors.blue,
          //       ),
          //       Container(
          //         color: Colors.green,
          //       ),
          //       Container(
          //         color: Colors.yellow,
          //       ),
          //       Container(
          //         color: Colors.black,
          //       ),
          //       Container(
          //         color: Colors.pink,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: GridView.builder(
              itemCount: colors.length,
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                //
                return Container(
                  color: colors[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
