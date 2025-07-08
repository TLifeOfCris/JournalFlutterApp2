import 'package:flutter/material.dart';

class OwnIcon extends StatelessWidget {
  final IconData? icon;
  final Color? color; 
  final VoidCallback? onTap;
  final bool isSelected;
  const OwnIcon({super.key, this.color, this.icon, this.onTap, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: isSelected ? Border.all(color: Colors.black, width: 3) : null,
            color: isSelected ? Colors.grey.shade300 : Colors.transparent,
        ),
              child: Icon(icon,
      size: isSelected ? 40 : 30,
      color: color,
      ),
      ),

    );
  }
}