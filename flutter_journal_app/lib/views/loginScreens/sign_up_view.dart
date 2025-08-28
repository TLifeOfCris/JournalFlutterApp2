import 'package:flutter/material.dart';
import 'package:flutter_journal_app/widgets/reutilizables/button_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/text_widget_welcome_screen.dart';
import 'package:flutter_journal_app/widgets/reutilizables/textfield_logs.dart';

class SignUpView extends StatelessWidget {
  var signEmail = TextEditingController();
  var signPassword = TextEditingController();
   SignUpView({super.key});

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

          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 40,),
            TextWidgetWelcomeScreen(texteo: 'SIGN UP'),
            SizedBox(height: 70,),
            Image.asset('assets/images/2341.png', height: 400,),
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
            
            SizedBox(height: 20,),

            ButtonWelcomeScreen(texteo: 'SIGN IN',  
            textColor: Colors.white ,
            color: Color(0xFF424242),
            onPressed: (){
              Navigator.pushNamed(context, '/homeview');
            })

            
          ],
          
        ),
      ),
      
    );
  }
}