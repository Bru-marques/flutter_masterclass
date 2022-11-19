import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/animation-one/controlled_animation_one.dart';
import 'package:playground/Pages/class-four/animation-one/implicit_animation_one.dart';
import 'package:playground/Pages/class-four/animation-two.dart/implicit_animation_two.dart';
import 'package:playground/Pages/class-four/facebook-responsive-login/facebook_responsive_login.dart';
import 'package:playground/Pages/class-three/blue_login.dart';
import 'package:playground/Pages/class-three/money_controll.dart';
import 'package:playground/Pages/class-three/tinder.dart';
import 'package:playground/Pages/class-one/cpf_validator.dart';
import 'package:playground/Pages/class-one/credt_card_validator.dart';
import 'package:playground/Pages/class-one/recursive_function.dart';
import 'package:playground/Pages/class-one/rule_of_three.dart';
import 'package:playground/Pages/class-three/vigenere_cipher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            title: const Text('Playground',
                style: TextStyle(fontFamily: 'Charlet', fontSize: 26))),
        body: _body(context)));
  }

  _body(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: (ListView(
        children: [
          _linkPage(context, '1. Função Recursiva', const RecursiveFunction()),
          _linkPage(context, '2. Regra de 3', const RoleOfTrhee()),
          _linkPage(context, '3. Validador de Cartão de Crédito',
              const CreditCardValidator()),
          _linkPage(context, '4. Validaror de CPF', const CpfValidadtor()),
          _linkPage(
              context, '5. Money Control Login Layout', const MoneyControl()),
          _linkPage(context, '6. Tinder Login Layout', const Tinder()),
          _linkPage(context, '7. Blue Login Layout', const BlueLogin()),
          _linkPage(context, '8. Vigenère cipher', const VigenereCipher()),
          _linkPage(
            context,
            '10. Implicit Animation one',
            const ImplicitAnimationOne(),
          ),
          _linkPage(
            context,
            '11. Controlled Animation one',
            const ControlledAnimationOne(),
          ),
          _linkPage(context, '12. Implicit Animation two',
              const ImplicitAnimationTwo()),
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
}
