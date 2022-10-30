import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tinder extends StatelessWidget {
  const Tinder({Key? key}) : super(key: key);

  final LinearGradient gradient = const LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [
      Color.fromARGB(240, 248, 104, 75),
      Color.fromARGB(255, 241, 95, 119),
      Color.fromARGB(253, 241, 95, 119),
      Color.fromARGB(255, 246, 70, 100),
    ],
  );

  final String appleIcon = 'assets/images/apple_logo_white.svg';
  final String logoIcon = 'assets/images/tinder_logo.svg';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 40),
        decoration: BoxDecoration(gradient: gradient),
        child: Stack(
          children: [
            _goBack(context),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(child: _logo()),
                const SizedBox(height: 100),
                _description(context),
                const SizedBox(height: 40),
                _button('appleIcon', 'SIGN IN WITH APPLE'),
                const SizedBox(height: 10),
                _button('appleIcon', 'SIGN IN WITH'),
                const SizedBox(height: 10),
                _button('appleIcon', 'SIGN IN WITH'),
                const SizedBox(height: 20),
                _footerText(),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _goBack(context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
          height: 48,
          width: 48,
          child: IconButton(
              onPressed: (() => Navigator.pop(context)),
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white)),
    );
  }

  Widget _logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(logoIcon,
            color: Colors.white, semanticsLabel: 'Tinder logo', height: 46),
        const SizedBox(width: 8),
        const Text(
          'tinder',
          style: TextStyle(
              height: 1.1,
              color: Colors.white,
              fontSize: 60,
              fontWeight: FontWeight.bold,
              fontFamily: 'Charlet'),
        ),
      ],
    );
  }

  Widget _description(context) {
    return RichText(
        textAlign: TextAlign.center,
        text: const TextSpan(
          text: 'By tapping Create Account or Simg In, you agree to our ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
          children: [
            TextSpan(
                text: 'Terms',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(text: '. Learn how we process your data in our '),
            TextSpan(
                text: 'Privacity Policy',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                )),
            TextSpan(text: ' and '),
            TextSpan(
                text: 'Cookies Policy',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.bold,
                )),
          ],
        ));
  }

  Widget _footerText() {
    return Text(
      'Trouble Sign In?',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
    );
  }

  _button(String logo, String label) {
    return Container(
        height: 52,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            borderRadius: BorderRadius.circular(25)));
  }
}
