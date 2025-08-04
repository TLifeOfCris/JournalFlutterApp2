import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:provider/provider.dart';

void _editEntry(BuildContext context, Journey entry){
  final controller = TextEditingController(text: entry.content);



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
          Provider.of<ViewModelProvider>(context, listen: false).UpdateContent(entry.id, newContent);
        }
        Navigator.of(context).pop();
      }, child: Text('Guardar'))
    ],

  ),
    
  );
}