import 'package:flutter/material.dart';
import 'package:playground/util/custom_text.dart';

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
    return (Padding(
      padding: const EdgeInsets.all(20),
      child: Form(
        child: Column(
          children: [
            const CustomText('Insira o numero do seu cartão de crédito', ''),
            TextFormField(
                initialValue: '',
                keyboardType: TextInputType.number,
                validator: (value) => _validator(value),
                autovalidateMode: AutovalidateMode.always,
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
            CustomText('1 - Ultimo digito: ', '$lastDigit'),
            CustomText(
                '2 - Index impar * 1 e  index par * 2 :', '$newCardArray'),
            CustomText('2 - Soma de todos os valores :', '$sumAll'),
            CustomText('3 - Soma dividido por 10:', '$dividedByTem'),
            CustomText('3 - Resto da  divisão:', '$fraction'),
            CustomText('4 - Resto  - 10:', '$subtracttem'),
            CustomText('5 - Resultado', '$result'),
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
    var newNumber = 0;
    var newDouble = 0;

    //parse input into numbers
    cardArray = (cardValue).split('').map((item) {
      return int.parse(item);
    }).toList();
    lastDigit = cardArray.isNotEmpty ? cardArray.last : 0;
    setState(() {
      newCardArray = cardArray.asMap().entries.map((item) {
        var index = item.key;
        var num = item.value;
        var doubleNum = (num * 2).toString();

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
      sumAll = newCardArray.isNotEmpty
          ? newCardArray.reduce(
              (value, element) => value + element,
            )
          : 0;
      dividedByTem = sumAll / 10;
      fraction = dividedByTem - dividedByTem.truncate();
      subtracttem = fraction > 0 ? fraction - 10 : fraction;
      result = lastDigit == subtracttem;
    });
  }
}
