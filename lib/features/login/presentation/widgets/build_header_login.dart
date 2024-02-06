import 'package:flutter/material.dart';

class BuildHeaderLogin extends StatelessWidget {
  const BuildHeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/login.png',
          width: 150,
          height: 150,
        ),
        const Text(
          'Welcome back',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
        ),
        const Text(
          'Sign in to continue',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff8d8b8b),
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
