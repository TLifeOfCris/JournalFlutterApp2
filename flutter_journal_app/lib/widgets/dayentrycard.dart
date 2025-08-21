import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/views/edit_entry.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_journal_app/widgets/editpopout.dart';


//revisar que este correcto 



class Dayentrycard extends StatelessWidget {
  final DateTime day;
  final List<Journey> entries;
  const Dayentrycard({super.key,
   required this.day,
    required this.entries});



    //revisar que este correcto

  
/*
  void _editEntry(BuildContext context, Journey entry){
  final controller = TextEditingController(text: entry.content);
  IconData selectedMood = entry.mood;



  showDialog(context: context, builder: (_) => AlertDialog(

    title: Text('Editar entrada'),
    content: TextField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(hintText: 'Editar content...'),

    ),
    actions: [
      TextButton(onPressed: () => Navigator.of(context).pop(), 
      child: Text('Cancelar'),
      ),
      ElevatedButton(onPressed: (){
        final newContent = controller.text.trim();
        if (newContent.isNotEmpty){
          Provider.of<ViewModelProvider>(context, listen: false).UpdateContent(entry.id, newContent,);
        }
        Navigator.of(context).pop();
      }, child: Text('Guardar'))
    ],

  ),
    
  );
} */

void _editEntry(BuildContext context, Journey entry){
  Navigator.push(context, MaterialPageRoute(builder: (_) => EditEntryCard(entry: entry)));
}


  String getFormattedDate(DateTime timestamp){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final entryDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    final formattedDate = DateFormat('MMM d').format(timestamp).toUpperCase();
    

    if (entryDate == today){
      return 'TODAY $formattedDate';
    } else if (entryDate == today.subtract(Duration(days: 1))){
      return "YESTERDAY $formattedDate";
    } else {
      final weekday = DateFormat('EEEE').format(timestamp).toUpperCase();
      return "$weekday $formattedDate";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //HEADER CON FECHA
            Container(
              width: double.infinity,
              color: Color.fromARGB(200, 119, 221, 119),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8.0,),
                  Text(
                    getFormattedDate(day),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            //entradas de ese dia
            ...entries.map((entry){
              //AQUÍ LA VA LA LOGICA BORRAR SI NO FUNCIONA OK DE TODOS MODOS
              //ESTA LA VERSIÓN ANTERIOR A ESTA EN GITHUB POR SI FALLA 
              return Slidable(// el Slidable va dentro del Widget DayEntryCard porque es para los de adentro
                key: ValueKey(entry.timestamp.toIso8601String()), //Esto es una clave unica 
                endActionPane: ActionPane(
                  motion: const ScrollMotion(), 
                  children: [
                    SlidableAction(onPressed: (_){
                      Provider.of<ViewModelProvider>(context, listen: false).deleteSpeciftEntry(entry);
                    },
                    backgroundColor: Colors.red, //Color por mientras luego se cambia
                    foregroundColor: Colors.white, //color por mientras luego se cambia
                    icon:  Icons.delete, //Cambiar Icon
                    label: 'Eliminar', //Cambiar label
                    )
                    
                  ],),
                  
                child: InkWell(
                  //Checar esto 
                  onTap: () => _editEntry(context, entry),
                  child: Padding(padding: EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Icon(entry.mood, color: getMoodColor(entry.mood)),
                      const SizedBox(width: 8,),
                      Text(getMoodLabel(entry.mood),
                      style: TextStyle(color: getMoodColor(entry.mood)),
                      
                      ),
                      const SizedBox(width: 8,),
                      Expanded(child: Text(entry.content)),
                      Text(DateFormat('jm').format(entry.timestamp))
                    ],
                  ),),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}