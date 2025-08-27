import 'package:flutter/material.dart';
import 'package:flutter_journal_app/widgets/reutilizables/button_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/text_widget_welcome_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: //Color(0xFFF5F5F5), 
      //Color(0xFFFFF7ED),
      //Color(0xFFEDE7F6),
     // Color(0xFFE3F2FD),
     //Color(0xFFE8F5E9),
     Color(0xFFFAFAFA),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            TextWidgetWelcomeScreen(texteo: 'Welcome to Journey App', size: 24, fontWeight: FontWeight.bold,),
            SizedBox(height: 3,),
            TextWidgetWelcomeScreen(texteo: 'An excercise App that helps you to remember', color: Colors.grey),
            SizedBox(height: 100,),

            Image.asset('assets/images/imagen.png', height: 400,),
            SizedBox(height: 30,),


            ButtonWelcomeScreen(texteo: 'Log In', textColor: Colors.white, color: Color(0xFF212121),onPressed: (){
              Navigator.pushNamed(context, '/logIn');
            }),

            SizedBox(height: 24,),

            ButtonWelcomeScreen(texteo: 'Sign In', textColor: Colors.white, color: Color(0xFF212121), onPressed: (){
              Navigator.pushNamed(context, '/signIn');
            })
            
            
          ],
        ),
      ),
    );
  }
}

