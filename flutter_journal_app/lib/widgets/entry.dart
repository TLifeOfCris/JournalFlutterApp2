import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/utils/mood_utils.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:intl/intl.dart';


class EntryCard extends StatelessWidget {
  final Journey list;
  const EntryCard({super.key, required this.list});


  String getFormattedDate(DateTime timestamp){
    final now = DateTime.now();

    final difference = now.difference(timestamp).inDays;
    String formattedDate = DateFormat('MMM d').format(timestamp).toUpperCase();
    String dayLabel;
    if (difference == 0){
      return dayLabel = "TODAY $formattedDate";
    }else if (difference == 1){
      return dayLabel = "YESTERDAY $formattedDate";
    } else {
      String dayLabel = DateFormat('EEEE').format(timestamp).toUpperCase();
      return '$dayLabel $formattedDate';
    } 

  }

  


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //Barra superior
            Container(width: double.infinity,
            //personalizar dependiendo del mood
            color: Color.fromARGB(200, 119, 221, 119),
            padding: EdgeInsets.all(8),
            //personalizar
            //TODAY, YESTERDAY, SUNDAY,ETC
            //child: Text("Viernes 13"),
            
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.adjust),
                SizedBox(width: 8.0,),
                Text(getFormattedDate(list.timestamp)),
              ],
            ),
            
            ),
            Padding(padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //fila con carita mood y hora
                Row(
                  children: [
                    //en el text tiene que ir el mood
                    //Text("Feliz", style: TextStyle(fontSize: 20),),
                    Icon(list.mood, color: getMoodColor(list.mood),),
                    SizedBox(width: 8,),
                    Text(getMoodLabel(list.mood), style: TextStyle(color: getMoodColor(list.mood)),),
                    SizedBox(width: 8.0,),
                    //content
                    //Text("Hola"),
                    Text(list.content),
                    Spacer(),
                    //Hora en la que se creó
                    //Text("12:00")
                    Text(  DateFormat('jm').format(list.timestamp)),
                  ],
                )
              ],
            ),)
          ],
        ),
      ),
    );
  }
}