import 'package:flutter/material.dart';

class ButtonWelcomeScreen extends StatelessWidget {
  final String texteo;
  final double? size;
  final Color? color;
  final Color? textColor;
  final VoidCallback? onPressed;
  const ButtonWelcomeScreen({super.key, this.textColor,  this.size, required this.texteo, this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
              width: size ?? 350,
              height: size ?? 60,
              child: ElevatedButton(onPressed: onPressed, 
              child: Text(texteo, style: TextStyle(color: textColor),),
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(color)
              ),
              ),
              );
  }
}