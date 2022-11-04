import 'dart:math';

import 'package:flutter/material.dart';

class VigenereCipher extends StatefulWidget {
  const VigenereCipher({super.key});

  @override
  State<VigenereCipher> createState() => _VigenereCipherState();
}

class _VigenereCipherState extends State<VigenereCipher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vigenère cipher - Aula 3')),
      body: _body(),
    );
  }

  String input = '';
  String randomKey = '';
  String encodedMessage = '';
  String decodedMessage = '';
  List<String> chars =
      ' !"#\$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
          .split('');

  _body() {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text(
              'Insira o texto',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            TextField(onChanged: (value) {
              setState(() {
                input = value;
              });
            }),
            _customText('1. Random key:  ', _randomKey()),
            const SizedBox(height: 12),
            _customText('2. Encode:  ', _encode()),
            const SizedBox(height: 12),
            _customText('3. Decode:  ', _decode()),
          ],
        ));
  }

  //1. Random key
  String _randomKey() {
    var inputLenght = input.length;
    setState(() {
      randomKey = List.generate(
              inputLenght, (i) => chars.join()[Random().nextInt(chars.length)])
          .join();
    });

    return randomKey;
  }

  //2. Encode message
  String _encode() {
    var key = randomKey.split('');
    var msg = input.split('');
    var encode = [];
    if (msg.isNotEmpty) {
      for (int i = 0; i < input.length; i++) {
        encode.add((chars.indexWhere((e) => e == msg[i]) +
                chars.indexWhere((e) => e == key[i])) %
            chars.length);
      }
    }
    setState(() {
      encodedMessage = List.generate(
          encode.length, (index) => chars.elementAt(encode[index])).join();
    });
    return encodedMessage;
  }

  //3. Decode message
  String _decode() {
    var key = randomKey.split('');
    var msg = encodedMessage.split('');
    var decode = [];

    for (int i = 0; i < msg.length; i++) {
      decode.add(((chars.indexWhere((e) => e == msg[i]) -
                  chars.indexWhere((e) => e == key[i])) +
              chars.length) %
          chars.length);
    }
    setState(() {
      decodedMessage = List.generate(
          decode.length, (index) => chars.elementAt(decode[index])).join();
    });

    return decodedMessage;
  }

  Widget _customText(label, result) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
              fontFamily: 'Poppins', fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          result,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
