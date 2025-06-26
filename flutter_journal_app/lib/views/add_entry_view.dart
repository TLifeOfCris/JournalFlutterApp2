import 'package:flutter/material.dart';
import 'package:flutter_journal_app/widgets/reutilizables/iconwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddEntryView extends StatelessWidget {
  const AddEntryView({super.key});

  @override
  Widget build(BuildContext context) {

    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE d MMM yyyy').format(now);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('WHAT HAVE YOU',
              style: GoogleFonts.inter(fontSize: 40, 
              fontWeight: FontWeight.w600, color: Colors.blueGrey),
              ),
              Text('BEEN UP TO?',
              style: GoogleFonts.inter(fontSize: 40, 
              fontWeight: FontWeight.w600, color: Colors.blueGrey),),
          
              SizedBox(height: 30,),
          
              Text('How are you?',
              style: GoogleFonts.inter(fontSize: 40, 
              fontWeight: FontWeight.w600, color: Colors.blueGrey),),
          
              Text('Today $formattedDate', style: TextStyle( decoration: TextDecoration.underline),),
          
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Agregar las caritas
          
                  OwnIcon(icon: Icons.sentiment_very_satisfied, color: Colors.yellow,),
                  SizedBox(width: 10,),
                  OwnIcon(icon:  Icons.sentiment_neutral, color: Colors.grey,),
                  SizedBox(width: 10,),
                  OwnIcon(icon:  Icons.sentiment_dissatisfied, color:  Colors.blue,),
                  SizedBox(width: 10,),
                  OwnIcon(icon: Icons.help_outline, color: Colors.black,)
          
                ],
          
              
              ),
              Text(' Que fue lo que hiciste? '),
              SizedBox(
                width: 380,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'add note',
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}