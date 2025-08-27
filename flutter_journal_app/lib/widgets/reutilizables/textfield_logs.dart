import 'package:flutter/material.dart';

class TextfieldLogs extends StatelessWidget {
  final String texteo;
  final IconData iconData;
  final Color iconColor;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator; 
  final Color filledcolor;
  TextfieldLogs({super.key, 
   required this.texteo, 
   required this.iconData,
   required this.controller, 
   this.validator, 
   required this.filledcolor,
   required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                width: 500,
                height: 50, 
                
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  decoration: InputDecoration(
                    prefixIcon: Icon(iconData, color: iconColor),
                    filled: true,
                    fillColor: filledcolor ,
                    labelText: texteo,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                  
                ),
              ),
            );
  }
}