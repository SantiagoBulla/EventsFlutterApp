import 'package:flutter/material.dart';

class BuildFormButton extends StatelessWidget {
  final String buttonName;
  final VoidCallback? onPressedCallback;

  const BuildFormButton({super.key, required this.buttonName, required this.onPressedCallback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedCallback,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff00abfe),
        minimumSize: const Size(350, 50),
        elevation: 8,
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(3)),
          side: BorderSide(color: Color(0x00003cff)),
        ),
      ),
      child: Text(
        buttonName,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
