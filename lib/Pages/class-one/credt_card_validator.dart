// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class CreditCardValidator extends StatefulWidget {
  const CreditCardValidator({Key? key}) : super(key: key);

  @override
  State<CreditCardValidator> createState() => _CreditCardValidatorState();
}

var cardValue = '';
var cardArray = [];
var lastDigit = 0;
var sumAll = 0;
var dividedByTem = 0.0;
var subtracttem = 0.0;
var fraction = 0.0;
var result = false;
List<int> newCardArray = [];

class _CreditCardValidatorState extends State<CreditCardValidator> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
            title: const Text('Validador de Cartão de Crédito - Aula 1')),
        body: _body()));
  }

  _body() {
    print(sumAll / 10);
    return (Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            _text('Insira o numero do seu cartão de crédito', ''),
            TextFormField(
                initialValue: '',
                keyboardType: TextInputType.number,
                validator: (value) => _validator(value),
                onChanged: (value) {
                  setState(() {
                    cardValue = value;
                  });
                }),
            ElevatedButton(
              onPressed: () => _handleValidator(),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              child: const Text('Validar'),
            ),
            _text('1 - Ultimo digito: ', '$lastDigit'),
            _text('2 - Index impar * 1 e  index par * 2 :', '$newCardArray'),
            _text('2 - Soma de todos os valores :', '$sumAll'),
            _text('3 - Soma dividido por 10:', '$dividedByTem'),
            _text('3 - Resto da  divisão:', '$fraction'),
            _text('4 - Resto  - 10:', '$subtracttem'),
            _text('5 - Resultado', '$result'),
          ],
        ),
      ),
    ));
  }

  _validator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  _handleValidator() {
    var num = 0;
    int index = 0;
    int newNumber = 0;
    var doubleNum = '';
    var newDouble = 0;
    cardArray = (cardValue).split('').map((item) {
      return int.parse(item);
    }).toList();
    lastDigit = cardArray.last;
    setState(() {
      newCardArray = cardArray.asMap().entries.map((item) {
        index = item.key;
        num = item.value;
        doubleNum = (num * 2).toString();

        if (doubleNum.length > 1) {
          doubleNum.split('');
          newDouble = int.parse(doubleNum[1]) + 1;
        }

        newNumber = index % 2 != 0
            ? num
            : (index % 2 == 0 && doubleNum.length > 1)
                ? newDouble
                : num * 2;
        return newNumber;
      }).toList();
      sumAll = newCardArray.reduce(
        (value, element) => value + element,
      );
      dividedByTem = sumAll / 10;
      fraction = dividedByTem - dividedByTem.truncate();
      subtracttem = fraction > 0 ? fraction - 10 : fraction;
      result = lastDigit == subtracttem;
    });
  }

  _text(String label, String result) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.visible,
            fontFamily: 'Poppins',
            fontSize: 16,
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
