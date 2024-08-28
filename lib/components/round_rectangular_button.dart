import 'package:flutter/material.dart';

class RoundRectangularButton extends StatefulWidget {
  final String labelText;
  final VoidCallback onPressAction;
  final bool isActive;

  const RoundRectangularButton(
      {super.key,
      required this.labelText,
      required this.onPressAction,
      this.isActive = true});

  @override
  State<StatefulWidget> createState() => _RoundRectangularButtonState();
}

class _RoundRectangularButtonState extends State<RoundRectangularButton> {
  @override
  Widget build(BuildContext context) {
    Color buttonColor = widget.isActive
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.secondary;

    Color textColor = widget.isActive
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onSecondary;

    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(buttonColor)),
        onPressed: widget.onPressAction,
        child: Text(widget.labelText,
            style: TextStyle(color: textColor, fontSize: 20)));
  }
}
