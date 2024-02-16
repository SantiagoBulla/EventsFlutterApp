import 'package:flutter/material.dart';

class ExitButton extends StatelessWidget {
  final VoidCallback onPressedAction;
  final String textButton;
  final IconData? iconButton;

  const ExitButton(
      {super.key,
      required this.onPressedAction,
      required this.textButton,
      this.iconButton});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressedAction,
      style: TextButton.styleFrom(
        maximumSize: const Size.fromWidth(100),
        backgroundColor: Colors.redAccent,
        // Color de fondo del botón
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        // Padding dentro del botón
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Bordes redondeados
        ),
      ),
      child: Row(
        children: [
          Icon(iconButton, color: Colors.white),
          Expanded(child: Text(textButton,style: TextStyle(color: Colors.white, fontSize: 18),)),
        ],
      ),
    );
  }
}
