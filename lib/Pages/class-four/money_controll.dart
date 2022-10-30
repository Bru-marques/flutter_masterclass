import 'package:flutter/material.dart';

class MoneyControll extends StatelessWidget {
  const MoneyControll({Key? key}) : super(key: key);

  final Color purple = const Color(0xff5E5CE5);
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(height: 200),
            _logo(),
            const SizedBox(height: 60),
            _title(),
            const SizedBox(height: 10),
            _description(),
            const SizedBox(height: 80),
            _button('Sign Up with Email ID', 'purple'),
            _button('Sign Up with Google', 'white'),
            const SizedBox(height: 60),
            _footerText(context)
          ],
        ));
  }

  Widget _logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: purple,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                color: purple,
                borderRadius:
                    const BorderRadius.only(bottomLeft: Radius.circular(40)),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
        Container(
          height: 100,
          width: 50,
          decoration: BoxDecoration(
            color: purple,
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(60), topRight: Radius.circular(60)),
          ),
        ),
      ],
    );
  }

  Widget _title() {
    return const Text(
      'Get your Money\nUnder Control',
      textAlign: TextAlign.center,
      style: TextStyle(
          height: 1.3,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 34),
    );
  }

  Widget _description() {
    return const Text(
      'Manage your expenses.\n Seamlessly.',
      textAlign: TextAlign.center,
      style: TextStyle(height: 1.3, color: Colors.white54, fontSize: 20),
    );
  }

  Widget _button(String label, String color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color != 'purple'
                ? const Color.fromARGB(255, 240, 240, 240)
                : purple,
            borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (color != 'purple')
              SizedBox(
                  child: Image.network(
                      'http://pngimg.com/uploads/google/google_PNG19635.png',
                      height: 28,
                      fit: BoxFit.cover)),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: color != 'purple' ? Colors.black : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _footerText(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
