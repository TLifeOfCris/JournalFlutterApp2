import 'package:flutter/material.dart';

class EntryCard extends StatelessWidget {
  const EntryCard({super.key});

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
          child: Text("Viernes 13"),
          
          ),
          Padding(padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //fila con carita mood y hora
              Row(
                children: [
                  //en el text tiene que ir el mood
                  Text("Feliz", style: TextStyle(fontSize: 20),),
                  SizedBox(width: 8,),
                  Text("Hola"),
                  Spacer(),
                  Text("12:00")
                ],
              )
            ],
          ),)
        ],
      ),
    );
  }
}