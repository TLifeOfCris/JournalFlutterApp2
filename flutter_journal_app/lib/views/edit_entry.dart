import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:provider/provider.dart';

class EditEntryCard extends StatefulWidget {
  final Journey entry;
  const EditEntryCard({super.key, required this.entry});

  @override
  State<EditEntryCard> createState() => _EditEntryCardState();
}

class _EditEntryCardState extends State<EditEntryCard> {
  late TextEditingController _controller;
  late IconData? _selectedMood;

  @override
  void initState(){
    super.initState();
    _controller = TextEditingController(text: widget.entry.content);
    _selectedMood = widget.entry.mood;
  }

  @override
  void dispose(){
    _controller.dispose();
    super.dispose();
  }

  void _saveChanges(){
    final text = _controller.text.trim();
    if (text.isNotEmpty && _selectedMood != null){
      Provider.of<ViewModelProvider>(context, listen: false).UpdateContent(
        //selected mood agregado aqui
        widget.entry.id, text, _selectedMood!,
      );
      Navigator.pop(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar entrada'),),
      body: Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            maxLines: null,
            decoration: const InputDecoration(
              hintText:  'Editar contenido',
            ),
          ),
          const SizedBox(height: 16,),
          Wrap(
            spacing: 10,
            children: moodinfoMap.entries.map((entry){
              return ChoiceChip(label: Icon(entry.key), selected: _selectedMood == entry.key,
              selectedColor: getMoodColor(entry.key),
              onSelected: (_){
                setState(() {
                  _selectedMood = entry.key;
                });
              },);
            }).toList(),
          ),
          const Spacer(),
          ElevatedButton(onPressed: _saveChanges, child: Text('Guardar Cambios'))
        ],
      ),),
    );
  }
}