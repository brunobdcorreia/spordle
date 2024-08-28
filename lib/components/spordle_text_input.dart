import 'package:flutter/material.dart';
import 'package:spordle/constants/spordle_borders.dart';

class SpordleTextInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;

  const SpordleTextInput(
      {super.key,
      required this.label,
      required this.controller,
      required this.type,
      this.hint = "",
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          margin: const EdgeInsets.symmetric(vertical: 6),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          decoration: BoxDecoration(
              border: SpordleBorders.primaryStrokeBorder(
                  Theme.of(context).colorScheme.primary),
              borderRadius: SpordleBorders.tiltBorders),
          child: TextField(
              controller: controller,
              keyboardType: type,
              obscureText: isPassword,
              decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: hint,
                  hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.surfaceDim)))),
      Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 3),
          color: Theme.of(context).colorScheme.surface,
          child: Text(label,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 10,
              )))
    ]);
  }
}
