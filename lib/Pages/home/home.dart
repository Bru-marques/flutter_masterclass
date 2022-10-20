import 'package:flutter/material.dart';
import 'package:playground/Pages/class-one/credt_card_validator.dart';
import 'package:playground/Pages/class-one/recursive_function.dart';
import 'package:playground/Pages/class-one/rule_of_three.dart';

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
        _linkPage(context, 'Regra de 3', const RoleOfTrhee()),
        _linkPage(context, 'Validador de Cartão de Crédito',
            const CreditCardValidator()),
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
