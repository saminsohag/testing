import 'package:flutter/material.dart';
import 'package:testing/src/home/count.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Count count = Count();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: ListenableBuilder(
          listenable: count,
          builder: (context, snapshot) {
            return Text("${count.value}");
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: count.decrement,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: count.reset,
            child: const Icon(Icons.exposure_zero),
          ),
          FloatingActionButton(
            onPressed: count.increment,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
