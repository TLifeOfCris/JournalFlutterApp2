import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';

class EntryCard extends StatelessWidget {
  final Journey list;
  const EntryCard({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
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
          child: Text(list.timestamp.toString()),
          
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
                  Icon(list.mood),
                  SizedBox(width: 8,),
                  //content
                  //Text("Hola"),
                  Text(list.content),
                  Spacer(),
                  //Hora en la que se creó
                  //Text("12:00")
                  Text(list.timestamp.toString()),
                ],
              )
            ],
          ),)
        ],
      ),
    );
  }
}