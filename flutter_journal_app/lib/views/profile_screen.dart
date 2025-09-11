import 'package:flutter/material.dart';
import 'package:flutter_journal_app/viewmodels/authProvider.dart';
import 'package:flutter_journal_app/widgets/reutilizables/button_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/text_widget_welcome_screen.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios_new)),
      ),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 40,),

            TextWidgetWelcomeScreen(texteo: 'PROFILE'),

            Container(
              margin: EdgeInsets.only(top:20 ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.deepPurple, width: 2),
              ),
              child: CircleAvatar(
                radius: 50,
                //background image será para la foto de perfil
              ),
              ),
              
              SizedBox(height: 20,),

              TextWidgetWelcomeScreen(texteo: 'NOMBRE DE PERSONA'),

              SizedBox(height: 30,),

              TextWidgetWelcomeScreen(texteo: 'CORREO ELECTRONICO'),

              SizedBox(height: 30,),

              TextWidgetWelcomeScreen(texteo: 'UID'),

              SizedBox(height: 30,),


              ButtonWelcomeScreen(texteo: 'LOG OUT', onPressed: () async {

                final authProvider = Provider.of<AuthProvider>(context, listen: false);

                await authProvider.signOut();

                print('exitoso');


                Navigator.pushNamedAndRemoveUntil(context, '/welcomeScreen', (Route<dynamic> route) => false);
              })

          ]
        )
      ),
      
    );
  }
}