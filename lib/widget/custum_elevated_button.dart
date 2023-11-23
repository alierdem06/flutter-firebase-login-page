import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.blueGrey,
  });

  final VoidCallback onPressed;
  final String buttonText;
  final Color textColor;
  final Color backgroundColor;

  @override
  State<CustomElevatedButton> createState() => _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.backgroundColor,
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.buttonText,
        style: TextStyle(color: widget.textColor),
      ),
    );
  }
}
