import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;
  final String result;
  const CustomText(
    this.label,
    this.result, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible,
            fontFamily: 'Poppins',
            fontSize: 18,
            height: 2,
          ),
        ),
        Text(
          result,
          style: const TextStyle(
            overflow: TextOverflow.visible,
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
