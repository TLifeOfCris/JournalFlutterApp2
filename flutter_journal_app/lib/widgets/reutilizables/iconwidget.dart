import 'package:flutter/material.dart';

class OwnIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color; 
  final VoidCallback? onTap;
  const OwnIcon({super.key, this.color, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon,
      size: 52,
      color: color,),
    );
  }
}