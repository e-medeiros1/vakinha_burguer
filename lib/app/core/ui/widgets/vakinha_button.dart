import 'package:flutter/material.dart';

class VakinhaButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final double? widht;
  final double height;
  final Color? color;

  const VakinhaButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.widht,
    this.height = 50,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widht,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: color,
        ),
      ),
    );
  }
}
