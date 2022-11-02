import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/blue_login.dart';
import 'package:playground/Pages/class-four/money_controll.dart';
import 'package:playground/Pages/class-four/tinder.dart';
import 'package:playground/Pages/class-one/cpf_validator.dart';
import 'package:playground/Pages/class-one/credt_card_validator.dart';
import 'package:playground/Pages/class-one/recursive_function.dart';
import 'package:playground/Pages/class-one/rule_of_three.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static Color purple = const Color(0xff4D5ABE);
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            backgroundColor: purple,
            title: const Text('Playground',
                style: TextStyle(fontFamily: 'Charlet', fontSize: 26))),
        body: _body(context)));
  }

  _body(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: (Column(
        children: [
          _title('Desafios Aula 1'),
          _linkPage(context, '1. Função Recursiva', const RecursiveFunction()),
          _linkPage(context, '2. Regra de 3', const RoleOfTrhee()),
          _linkPage(context, '3. Validador de Cartão de Crédito',
              const CreditCardValidator()),
          _linkPage(context, '4. Validaror de CPF', const CpfValidadtor()),
          const Divider(color: Color.fromARGB(255, 12, 72, 156)),
          _title('Desafios Aula 3'),
          _linkPage(context, '5. Money Controll Layout', const MoneyControll()),
          _linkPage(context, '6. Tinder Layout', const Tinder()),
          _linkPage(context, '7. Login Layout 01', const BlueLogin()),
        ],
      )),
    );
  }

  Widget _linkPage(BuildContext context, String title, Widget page) {
    return (InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => page)),
      child: Container(
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

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
        height: 2,
        fontFamily: 'Poppins',
        fontSize: 18,
      ),
    );
  }
}
