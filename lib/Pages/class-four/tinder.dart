import 'package:flutter/material.dart';

class Tinder extends StatelessWidget {
  const Tinder({Key? key}) : super(key: key);

  final LinearGradient gradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(255, 255, 143, 120),
      Color.fromARGB(255, 241, 95, 119),
      Color.fromARGB(253, 241, 95, 119),
      Color.fromARGB(255, 246, 70, 100),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
        decoration: BoxDecoration(gradient: gradient),
        child: Column(
          children: [
            _goBack(context),
          ],
        ),
      ),
    );
  }

  Widget _goBack(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
          height: 48,
          width: 48,
          child: IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white)),
    );
  }
}
