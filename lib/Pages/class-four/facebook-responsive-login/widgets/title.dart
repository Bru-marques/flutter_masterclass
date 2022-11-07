import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'facebook',
      style: TextStyle(
          color: const Color.fromARGB(255, 33, 128, 243),
          fontWeight: FontWeight.w900,
          fontSize: 50),
    );
  }
}
