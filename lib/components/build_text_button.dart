import 'package:flutter/material.dart';

class BuildTextButton extends StatelessWidget {
  final String value;
  final int color;

  const BuildTextButton({super.key, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        value,
        style: TextStyle(color: Color(color)),
      ),
    );
  }
}
