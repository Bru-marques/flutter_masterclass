import 'package:flutter/material.dart';

class RoleOfTrhee extends StatefulWidget {
  const RoleOfTrhee({Key? key}) : super(key: key);

  @override
  State<RoleOfTrhee> createState() => _RoleOfTrheeState();
}

var d = '0';
var a = '0';
var b = '0';
var c = '0';
var newValue = '';
var result = '';

class _RoleOfTrheeState extends State<RoleOfTrhee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Regra de 3')), body: _body());
  }

  _body() {
    return (Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Valor de A',
                      ),
                      initialValue: '0',
                      validator: (value) => _validator(value),
                      onChanged: (value) {
                        setState(() {
                          a = value;
                        });
                      }),
                ),
                const Text('Está para'),
                SizedBox(
                  width: 80,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Valor de B',
                      ),
                      initialValue: '0',
                      validator: (value) => _validator(value),
                      onChanged: (value) {
                        setState(() {
                          b = value;
                        });
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Valor de C',
                      ),
                      initialValue: '0',
                      validator: (value) => _validator(value),
                      onChanged: (value) {
                        setState(() {
                          c = value;
                        });
                      }),
                ),
                const Text('Assim como'),
                SizedBox(
                  width: 80,
                  child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Valor de D',
                      ),
                      initialValue: '0',
                      validator: (value) => _validator(value),
                      onChanged: (value) {
                        setState(() {
                          d = value;
                        });
                      }),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  _handleCalculate(
                      int.parse(a), int.parse(b), int.parse(c), int.parse(d));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: const Text('Calcular')),
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
        ),
      ),
    ));
  }

  _validator(String? value) {
    setState(() {
      newValue = value == null || value.isEmpty ? '' : value;
    });
    return newValue;
  }

  _handleCalculate(a, b, c, d) {
    if (d == 0) {
      d = (c * b) / a;
      return result = d.toString();
    } else if (c == 0) {
      c = (a * d) / b;
      return result = c.toString();
    } else if (a == 0) {
      a = (c * b) / d;
      return result = c.toString();
    } else {
      b = (a * d) / c;
      return result = c.toString();
    }
  }
}
