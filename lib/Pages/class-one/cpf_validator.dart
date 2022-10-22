import 'package:flutter/material.dart';
import 'package:playground/util/custom_text.dart';

class CpfValidadtor extends StatefulWidget {
  const CpfValidadtor({Key? key}) : super(key: key);

  @override
  State<CpfValidadtor> createState() => _CpfValidadtorState();
}

class _CpfValidadtorState extends State<CpfValidadtor> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(title: const Text('Validador de CPF - Aula 1')),
        body: _body()));
  }

  var initialValue = '87470038809';
  var cpfArray = [];
  var firstNineMultiplied = [];
  var firstTemMultiplied = [];
  var sumMultiplied = 0;
  var sumMultiplied2 = 0;
  var rest = 0;
  var rest2 = 0;

  _body() {
    return (Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CustomText('Validador de CPF', ''),
          TextFormField(
              initialValue: initialValue,
              onChanged: (value) => setState(() {
                    initialValue = value;
                  })),
          ElevatedButton(
              onPressed: () => _handleValidator(),
              child: const Text('Validar')),
          CustomText(
              '1- 9 primeiros digitos multiplicado da dir para a esq por núm crescentes a partir do núm 2 ',
              '$firstNineMultiplied'),
          CustomText('2- Soma dos digitos * numeros', '$sumMultiplied'),
          CustomText('3 - Resto da  divisão:', '$rest'),
          const Divider(color: Color.fromARGB(255, 12, 72, 156)),
          CustomText(
              '1- 10 primeiros digitos multiplicado da dir para a esq por núm crescentes a partir do núm 2 ',
              '$firstTemMultiplied'),
          CustomText('2- Soma dos digitos * numeros', '$sumMultiplied2'),
          CustomText('3 - Resto da  divisão:', '$rest2'),
        ],
      ),
    ));
  }

  _handleValidator() {
    var multipy = 10;
    var multipy2 = 11;
    setState(() {
      //parse input into numbers
      cpfArray = (initialValue).split('').map((item) {
        return int.parse(item);
      }).toList();

      // first 9  numbers
      var firstNineNum = cpfArray.getRange(0, 9);
      firstNineMultiplied = firstNineNum.map((item) {
        item *= multipy;
        multipy--;
        return item;
      }).toList();

      // first 10  numbers
      var firstTemNum = cpfArray.getRange(0, 10);
      firstTemMultiplied = firstTemNum.map((item) {
        item *= multipy2;
        multipy2--;
        return item;
      }).toList();

      //multiply 9 num by itself and sum all
      var multyplyNineByItself = [];
      multyplyNineByItself = firstNineMultiplied.asMap().entries.map((item) {
        var index = item.key + 1;
        var num = item.value;
        num * index;
        return num;
      }).toList();
      sumMultiplied = multyplyNineByItself.isNotEmpty
          ? multyplyNineByItself.reduce((value, element) => value + element)
          : 0;

      //multiply 10 num by itself and sum all
      var multyplyNTemByItself = [];
      multyplyNTemByItself = firstTemMultiplied.asMap().entries.map((item) {
        var index = item.key + 1;
        var num = item.value;
        num * index;
        return num;
      }).toList();

      sumMultiplied2 = multyplyNTemByItself.isNotEmpty
          ? multyplyNTemByItself.reduce((value, element) => value + element)
          : 0;

      // rest of sum divided by 11
      var restbyEleven = sumMultiplied % 11;
      rest = restbyEleven < 2 ? 0 : 11 - restbyEleven;

      var restbyEleven2 = sumMultiplied2 % 11;
      rest2 = restbyEleven2 < 2 ? 0 : 11 - restbyEleven2;
    });
  }
}
