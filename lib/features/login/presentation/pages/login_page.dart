import 'package:events/features/login/presentation/widgets/build_form_button.dart';
import 'package:events/features/login/presentation/widgets/build_header_login.dart';
import 'package:flutter/material.dart';

import '../widgets/build_text_button.dart';
import '../widgets/build_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 120, bottom: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const BuildHeaderLogin(),
                const SizedBox(height: 30),
                _buildForm(width: 400, height: 200),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: BuildTextButton(
                          value: 'Forgot password?', color: 0xff00abfe),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                BuildFormButton(
                  buttonName: 'Login',
                  onPressedCallback: () {
                    loginRedirectHome(context);
                  },
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      Text('Do not have an account?'),
                      BuildTextButton(
                          value: 'create a new account', color: 0xff36ae62)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginRedirectHome(BuildContext context) {
    Navigator.of(context).pushReplacementNamed('/dashboard');
    return;
  }
}

Widget _buildForm({required double height, required double width}) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.all(15),
    child: const Column(
      children: [
        BuildTextField(label: 'ID User'),
        Spacer(),
        BuildTextField(label: 'Password')
      ],
    ),
  );
}
