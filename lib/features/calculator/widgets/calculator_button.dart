import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color bgColor;
  final Widget? icon;
  const CalculatorButton({super.key, required this.text, required this.onTap, required this.bgColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(4.0),
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: bgColor,
        elevation: 0,
      ),
      child: icon ?? Text(text, style: const TextStyle(fontSize: 28, color: Colors.white)),
    ),
    );
  }
}