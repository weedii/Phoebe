import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final String? showMargin;
  final Color? bgColor;

  const MyButton({
    super.key,
    required this.onTap,
    required this.text,
    this.showMargin,
    this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: showMargin == null
            ? const EdgeInsets.symmetric(horizontal: 25)
            : const EdgeInsets.symmetric(horizontal: 0),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.yellow[700],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
