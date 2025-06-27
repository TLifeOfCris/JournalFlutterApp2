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


                        
              Text('How are you?',
              style: GoogleFonts.inter(fontSize: 40, 
              fontWeight: FontWeight.w600, color: Colors.blueGrey),),
              SizedBox(height: 15,),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_month, color: Colors.green, size: 20,),
                  Text('Today $formattedDate', 
                  style: TextStyle( decoration: TextDecoration.underline, color: Colors.green),),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Agregar las caritas
          
                  OwnIcon(onTap: () {
                    print(' feliz sleeccionado');
                  },
                    icon: Icons.sentiment_very_satisfied, color: Colors.yellow,),
                  SizedBox(width: 10,),
                  OwnIcon(onTap: () {
                    print(' MEH sleeccionado');
                  },icon:  Icons.sentiment_neutral, color: Colors.grey,),
                  SizedBox(width: 10,),
                  OwnIcon(onTap: () {
                    print(' triste sleeccionado');
                  },icon:  Icons.sentiment_dissatisfied, color:  Colors.blue,),
                  SizedBox(width: 10,),
                  OwnIcon(onTap: () {
                    print(' no sé sleeccionado');
                  },icon: Icons.help_outline, color: Colors.black,)
          
                ],
          
              
              ),

              
          
              SizedBox(height: 30,),
              
              Text('WHAT HAVE YOU',
              style: GoogleFonts.inter(fontSize: 40, 
              fontWeight: FontWeight.w600, color: Colors.blueGrey),
              ),
              Text('BEEN UP TO?',
              style: GoogleFonts.inter(fontSize: 40, 
              fontWeight: FontWeight.w600, color: Colors.blueGrey),),
          
          

              SizedBox(
                width: 380,
                height: 150,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'add note...',
                    contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.black, width: 2
                      )
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