import 'package:flutter/material.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/views/home_view.dart';
import 'package:flutter_journal_app/widgets/reutilizables/iconwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';


class AddEntryView extends StatelessWidget {
  const AddEntryView({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController note = TextEditingController();
    var viewModelProvider = context.watch<ViewModelProvider>();

    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE d MMM yyyy').format(now);
    var uuid = Uuid();
    String newId = uuid.v4();
    
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
      ),
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
                    viewModelProvider.setMood(Icons.sentiment_very_satisfied);
                  },
                    icon: Icons.sentiment_very_satisfied, color: Colors.yellow,),
                  SizedBox(width: 10,),
                  OwnIcon(onTap: () {
                    print(' MEH sleeccionado');
                    viewModelProvider.setMood(Icons.sentiment_neutral);
                  },icon:  Icons.sentiment_neutral, color: Colors.grey,),
                  SizedBox(width: 10,),
                  OwnIcon(onTap: () {
                    print(' triste sleeccionado');
                    viewModelProvider.setMood(Icons.sentiment_dissatisfied);
                  },icon:  Icons.sentiment_dissatisfied, color:  Colors.blue,),
                  SizedBox(width: 10,),
                  OwnIcon(onTap: () {
                    print(' no sé sleeccionado');
                    viewModelProvider.setMood(Icons.help_outline);
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

              SizedBox(height: 30,),
          
          

              SizedBox(
                width: 380,
                height: 150,
                child: TextField(
                  controller: note,
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


              GestureDetector(
                onTap: () {
                  final now = DateTime.now();
                  viewModelProvider.addEntrie(newId, note.text, viewModelProvider.selectedMood, now);
                  print('Subido');
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeView()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        offset: Offset(5.0, 5.0),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 0.0,
                        spreadRadius: 0.0,
                      )
                    ]
                  ),
                  
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.lightGreenAccent,
                    
                    child: Icon(Icons.check),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}