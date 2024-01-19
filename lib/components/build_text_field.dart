import 'package:flutter/material.dart';

class BuildTextField extends StatelessWidget {
  final String label;
  const BuildTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextField(
        decoration: InputDecoration(
          label: Text(label),
          labelStyle: const TextStyle(color: Color(0xff00abfe)),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Color(0xff00abfe), width: 1),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(color: Color(0xff36ae62), width: 1),
          ),
          floatingLabelStyle: const TextStyle(
            fontSize: 20,
            color: Color(0xff8d8b8b),
          ),
        ),
      ),
    );
  }
}
