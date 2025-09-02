import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import 'package:flutter/material.dart';
import 'package:flutter_journal_app/viewmodels/authProvider.dart';
import 'package:flutter_journal_app/widgets/reutilizables/button_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/text_widget_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/textfield_logs.dart';
import 'package:provider/provider.dart';

class LogInView extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LogInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 40,),
                TextWidgetWelcomeScreen(texteo: 'LOG IN'),
                SizedBox(height: 70,),
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
                  ButtonWelcomeScreen(texteo: 'LOG IN', onPressed: () async {


                    if (emailController.text.isEmpty || passwordController.text.isEmpty){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Completa todos los campos')));
                      return;
                    }
                    try{

                      final authProvider = Provider.of<AuthProvider>(context, listen: false);
                      //intento para logearse 

                      await  authProvider.signIn(emailController.text.trim(), passwordController.text.trim());

                      if (authProvider.status == AuthStatus.authenticated){
                        Navigator.pushReplacementNamed(context, '/add');
                      }
                    } on FirebaseAuthException catch (e){
                      String errorMessage = 'Error al iniciar sesion';
                      if (e.code == 'user-not-found'){
                        errorMessage = 'No se encontró ninguna cuenta con ese correo.';
                      } else if (e.code == 'wrong-password'){
                        errorMessage = 'La contraseña es incorrecta.';
                      } else if (e.code == 'invalid-email'){
                        errorMessage = 'El correo no es válido.';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
                    } catch (e){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Ocurrió un error inesperado $e')));
                    }



                    
                  })
              ],
          
            ),
          ),
        ),
      )
    );
  }
}