import 'package:flutter/material.dart';

void dispatchAlert(
    BuildContext context,
    String title,
    String description,
    String txtButton,
    ) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(description),
        actions: [
          TextButton(
            onPressed: () {
              // Cerrar el popup cuando se presiona el botón "OK"
              Navigator.of(context).pop();
            },
            child: Text(txtButton),
          ),
        ],
      );
    },
  );
}