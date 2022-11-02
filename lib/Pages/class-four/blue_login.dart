import 'package:flutter/material.dart';

class BlueLogin extends StatelessWidget {
  const BlueLogin({super.key});

  final List<Color> gradientList = const [
    Color(0xff594fcc),
    Color.fromARGB(255, 89, 79, 204),
    Color.fromARGB(255, 25, 103, 205),
    Color(0xff0597f2),
    Color(0xff398cbf),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Expanded(
            child: Column(
              children: [
                _gradientBackground(context),
              ],
            ),
          ),
          _loginContainer(),
          _loginButton(context),
        ],
      ),
    );
  }

  Widget _gradientBackground(context) {
    return Container(
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: gradientList,
          ),
        ),
        child: Center(
          child: Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(80)),
            child: ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (Rect bounds) {
                  return RadialGradient(
                    center: Alignment.bottomCenter,
                    radius: 1.0,
                    colors: gradientList,
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: const Icon(Icons.home, size: 66)),
          ),
        ));
  }

  Widget _loginContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 240),
        padding: const EdgeInsets.all(18),
        height: 320,
        width: double.infinity,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              blurRadius: 6,
              color: Color.fromARGB(213, 208, 208, 208),
              spreadRadius: 1,
              offset: Offset(0, 1))
        ], borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: _loginForm(),
      ),
    );
  }

  Widget _loginForm() {
    return Column(
      children: [
        const Text('LOGIN',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 22,
                fontWeight: FontWeight.w600)),
        const SizedBox(height: 40),
        _input('EMAIL'),
        const SizedBox(height: 40),
        _input('PASSWORD'),
      ],
    );
  }

  Widget _input(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: Color.fromARGB(255, 25, 103, 205),
                fontSize: 12,
                fontWeight: FontWeight.w700)),
        TextField(
          keyboardType: label == 'PASSWORD'
              ? TextInputType.visiblePassword
              : TextInputType.emailAddress,
          obscureText: label == 'PASSWORD' ? true : false,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
            ),
          ),
          style: const TextStyle(
              color: Colors.black, fontSize: 14, fontWeight: FontWeight.w700),
        )
      ],
    );
  }

  Widget _loginButton(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: 70.0, right: 70, top: MediaQuery.of(context).size.height * .78),
      child: Column(
        children: [
          Container(
            height: 64,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 25, 103, 205),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
                BoxShadow(
                    blurRadius: 6,
                    color: Color.fromARGB(231, 130, 163, 255),
                    spreadRadius: 1,
                    offset: Offset(0, 1))
              ],
            ),
            child: const Text('LOGIN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ),
          const SizedBox(height: 30),
          const Text('FORGOT PASSWORD?',
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 14,
                  fontWeight: FontWeight.w800)),
        ],
      ),
    );
  }
}
