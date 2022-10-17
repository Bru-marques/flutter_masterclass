// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:playground/Pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Masterclass',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key,) : super(key: key);

//   // final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   // int? recursiveInput = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home()
//     );
    // Scaffold(
    //   appBar: AppBar(
    //     title: Text(widget.title),
    //   ),

    // Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Center(child: TextField(
    //     onChanged: (value) {
    //       setState(() {
    //         recursiveInput = int.parse(value);
    //       });
    //     },
    //   )),
    // ),
    // floatingActionButton: FloatingActionButton(
    //   onPressed: () {
    //     _onClick(recursiveInput);
    //   },
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
    // ),
    // );
//   }
// }

// _onClick(value) {
//   // return value == 1 ? 1 : value * _onClick(value - 1);
// }
