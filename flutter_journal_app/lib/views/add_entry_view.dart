import 'package:flutter/material.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('How is it going?',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            SizedBox(height: 30,),

            Text('How are you?',
            style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w600),),

            Text('Today $formattedDate', style: TextStyle( decoration: TextDecoration.underline),),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Agregar las caritas

                Text('feliz'),
                SizedBox(width: 10,),
                Text('MEH'),
                SizedBox(width: 10,),
                Text('triste'),
                SizedBox(width: 10,),
                Text('?')

              ],
            )
          ],
        ),
      ),
    );
  }
}