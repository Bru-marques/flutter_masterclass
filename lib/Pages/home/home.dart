import 'package:flutter/material.dart';
import 'package:playground/Pages/recursive_function.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: const Text('Playground')), body: _body(context)));
  }

  _body(context) {
    return (Column(
      children: [
        _linkPage(context, 'Função Recursiva', const RecursiveFunction()),
      ],
    ));
  }

  Widget _linkPage(BuildContext context, String title, Widget page) {
    return (InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          height: 56,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded, size: 14)
            ],
          )),
    ));
  }
}
