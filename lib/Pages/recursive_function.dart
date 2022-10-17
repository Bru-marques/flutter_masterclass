import 'package:flutter/material.dart';

class RecursiveFunction extends StatefulWidget {
  const RecursiveFunction({Key? key}) : super(key: key);

  @override
  State<RecursiveFunction> createState() => _RecursiveFunctionState();
}

class _RecursiveFunctionState extends State<RecursiveFunction> {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text('Função Recursiva - Aula 1')),
      body: _body(),
    ));
  }

  var input = '';
  var result = 0;

  _body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: (Column(
        children: [
          const Text(
            'Implemente a sequencia fibonacci com funcões recursivamente usando o Dart.',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: TextField(onChanged: (value) {
                  setState(() {
                    input = value;
                  });
                }),
              ),
              ElevatedButton(
                  onPressed: () {
                    _handleCalculate(int.parse(input));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  child: const Text('Calcular'))
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Text(
                'Resultado: ',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                result.toString(),
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      )),
    );
  }

  _handleCalculate(value) {
    setState(() {
      result = value <= 1 ? 1 : value * _handleCalculate(value - 1);
    });
    return result;
  }
}
