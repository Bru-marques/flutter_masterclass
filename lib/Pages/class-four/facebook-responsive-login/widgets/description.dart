import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 380,
      child: Text(
        'O Facebook ajuda você a se conectar e compartilhar com as pessoas que fazem parte da sua vida.',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
      ),
    );
  }
}
