import 'package:flutter/material.dart';

class ProfileOptionButton extends StatelessWidget {
  final VoidCallback clickAction;
  final String description;
  final IconData? iconButton;

  const ProfileOptionButton(
      {super.key,
      required this.clickAction,
      required this.description,
      required this.iconButton});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: TextButton(
        onPressed: clickAction,
        style: TextButton.styleFrom(
          backgroundColor: const Color(0x9FD9D9D9),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 0),
          child: Row(
            children: [
              Center(
                child: Icon(iconButton, size: 30, color: Colors.blueGrey),
              ), // Espacio entre el icono y el texto
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    description,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
