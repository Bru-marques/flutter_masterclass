import 'package:flutter/material.dart';

class RoleOfTrhee extends StatefulWidget {
  const RoleOfTrhee({Key? key}) : super(key: key);

  @override
  State<RoleOfTrhee> createState() => _RoleOfTrheeState();
}

var input = '';

class _RoleOfTrheeState extends State<RoleOfTrhee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Regra de 3')), body: _body());
  }

  _body() {
    return (Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_fields(), const Text('Está para'), _fields()],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [_fields(), const Text('Assim como'), _fields()],
          ),
        ],
      ),
    ));
  }

  Widget _fields() {
    return (Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 80,
          child: TextField(onChanged: (value) {
            setState(() {
              input = value;
            });
          }),
        ),
      ],
    ));
  }
}
