import 'package:flutter/material.dart';
import 'package:flutter_journal_app/viewmodels/authProvider.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/widgets/reutilizables/button_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/text_widget_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/textfield_logs.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  var signEmail = TextEditingController();
  var signPassword = TextEditingController();
  var signCPassword = TextEditingController();
   SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: IconButton(onPressed: (){
      Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
        
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              TextWidgetWelcomeScreen(texteo: 'SIGN UP'),
              SizedBox(height: 70,),
              Image.asset('assets/images/2341.png', height: 300,),
              SizedBox(height: 30,),
              //VER QUE SE NECESITA 
              //EMAIL
              TextfieldLogs(texteo: 'Email',
               iconData: Icons.email,
               controller: signEmail,
               filledcolor: Colors.grey[100]!,
               iconColor: Colors.grey[700]!),
        
              TextfieldLogs(texteo: 'Password',
               iconData: Icons.password,
               controller: signPassword,
               filledcolor: Colors.grey[100]!,
               iconColor: Colors.grey[700]!),
        
              TextfieldLogs(texteo: 'Password confirmation', iconData: Icons.password, controller: signCPassword , filledcolor: Colors.grey[100]!, iconColor: Colors.grey[700]!),
              
              SizedBox(height: 20,),
        
              ButtonWelcomeScreen(texteo: 'SIGN IN',  
              textColor: Colors.white ,
              color: Color(0xFF424242),
              onPressed: () async {

                final email = signEmail.text.trim();
                final password = signPassword.text.trim();
                final confirmPassword = signCPassword.text.trim();

                //Validación básica
                if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Correo electrónico inválido')),
                  );
                  return;
                }

                if (password.length < 6){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
                  Text('La contraseña debe ser al menos de 6 caracteres')));
                  return;
                }

                if (password != confirmPassword){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Las contraseñas no coinciden')),
                  );
                  return; 
                }

                
        
                final authProvider = Provider.of<AuthProvider>(context, listen: false);
        
        
                await authProvider.signUp(email, password);
        
                if (authProvider.status == AuthStatus.authenticated){
                  Navigator.pushNamed(context, '/welcomeScreen');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('registro exitoso')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: 
                  Text('Erorr al registrarse')));
                }
               
              })
        
              
            ],
            
          ),
        ),
      ),
      
    );
  }
}