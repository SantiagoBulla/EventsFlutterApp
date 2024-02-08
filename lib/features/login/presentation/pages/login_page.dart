import 'package:events/core/params/login_params.dart';
import 'package:events/features/login/presentation/providers/login_privider.dart';
import 'package:events/features/login/presentation/widgets/build_form_button.dart';
import 'package:events/features/login/presentation/widgets/build_header_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/build_text_button.dart';
import '../widgets/build_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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
                _buildForm(
                    width: 400,
                    height: 200,
                    email: _emailController,
                    password: _passwordController),
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
                    loginRedirectHome(
                        context, [_emailController.text, _passwordController.text]);
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

  //metodo de login
  void loginRedirectHome(BuildContext context, dynamic data) async {
    AuthProvider loginProvider =
        Provider.of<AuthProvider>(context, listen: false);
    LoginParams params = LoginParams(email: data[0], password: data[1]);
    loginProvider.eitherFailureOrValidateUser(params: params);
    // Navigator.of(context).pushReplacementNamed('/dashboard');
    return;
  }
}

Widget _buildForm(
    {required double height,
    required double width,
    required TextEditingController email,
    required TextEditingController password}) {
  return Container(
    height: height,
    width: width,
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        BuildTextField(label: 'ID User', controller: email),
        const Spacer(),
        BuildTextField(
          label: 'Password',
          controller: password,
        )
      ],
    ),
  );
}
