import 'package:flutter/material.dart';

class OwnIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color; 
  const OwnIcon({super.key, this.color, this.icon });

  @override
  Widget build(BuildContext context) {
    return Icon(icon,
    size: 52,
    color: color,);
  }
}