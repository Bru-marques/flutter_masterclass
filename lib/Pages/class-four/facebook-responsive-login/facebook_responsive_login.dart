import 'package:flutter/material.dart';
import 'package:playground/Pages/class-four/facebook-responsive-login/widgets/description.dart';
import 'package:playground/Pages/class-four/facebook-responsive-login/widgets/title.dart';

class FacebookResponsiveLogin extends StatelessWidget {
  const FacebookResponsiveLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(child: Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 480) {
            return _mobileScreen();
          } else {
            return _wideScreen();
          }
        },
      ),
    ));
  }

  Widget _mobileScreen() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Column(
          children: const [
            CustomTitle(),
            Description(),
            LoginContainer(),
          ],
        ));
  }

  Widget _wideScreen() {
    return Container();
  }
}

class LoginContainer extends StatelessWidget {
  const LoginContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 380,
      height: 380,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(186, 226, 226, 226),
              offset: Offset(0, 4),
              spreadRadius: 4,
              blurRadius: 6),
          // BoxShadow(
          //     color: Color.fromARGB(130, 196, 196, 196),
          //     offset: Offset(0, 2),
          //     spreadRadius: 4,
          //     blurRadius: 2),
        ],
      ),
    );
  }
}
