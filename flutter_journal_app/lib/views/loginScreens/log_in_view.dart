import 'package:flutter/material.dart';
import 'package:flutter_journal_app/widgets/reutilizables/button_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/text_widget_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/textfield_logs.dart';

class LogInView extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            TextWidgetWelcomeScreen(texteo: 'LOG IN'),
            SizedBox(height: 100,),
            Image.asset('assets/images/2341.png', height: 400,),
            SizedBox(height: 30,),
            //Agregar verificación 
            TextfieldLogs(texteo: 'Correo',
             iconData: Icons.email,
             controller: emailController,
             filledcolor: Colors.grey[100]!,
             iconColor: Colors.grey[700]!),
            //Agregar verificación 
            TextfieldLogs(texteo: 'Contraseña', 
            iconData: Icons.password,
             iconColor: Colors.grey[700]!,
             filledcolor: Colors.grey[100]!,
              controller: passwordController),

              SizedBox(height: 20,),
              //Agregar logica firebase
              //Agregar logica de log in 
              ButtonWelcomeScreen(texteo: 'LOG IN', onPressed: (){
                Navigator.pushNamed(context, '/add');
              })
          ],

        ),
      )
    );
  }
}