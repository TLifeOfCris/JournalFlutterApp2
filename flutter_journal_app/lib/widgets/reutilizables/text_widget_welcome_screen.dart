import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextWidgetWelcomeScreen extends StatelessWidget {
  final String texteo;
  final double? size;
  final Color? color;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  const TextWidgetWelcomeScreen({
    required this. texteo, 
     this. size,
     this. color,
     this.fontWeight,
     this.textAlign = TextAlign.start
    
    
  });

  @override
  Widget build(BuildContext context) {
    return  Text(texteo,
    textAlign: textAlign,
    
     style: GoogleFonts.lato(fontSize: size ?? 18,
      color:  color ?? Colors.black,
      fontWeight: fontWeight ?? FontWeight.normal,
      ),
      );
  }
}
