import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ViewModelProvider extends ChangeNotifier{

  //Entries List
  final List<Journey> _entries = [

    Journey(id: '12344', content: 'Pueba', mood: Icons.sentiment_very_satisfied, timestamp: DateTime.now()),
    Journey(id: '12344', content: 'Prueba 2', mood: Icons.sentiment_very_satisfied, 
    timestamp: DateTime.now().subtract(Duration(days: 1)) )




  ];

  List<Journey> get entries => _entries;





IconData? _selectedMood;
IconData? get selectedMood => _selectedMood;

  void setMood(IconData mood){

    _selectedMood = mood;

    notifyListeners();

  }



  //Add entries method
  void addEntrie(String newid, String newcontent, IconData newmood,  final newtimestamp){

    final newEntrie = Journey(
     id: newid,
     content: newcontent,
     mood: _selectedMood!,
     timestamp: newtimestamp
     );

     

     entries.add(newEntrie);
     notifyListeners();
  }

  //Delete entrie from list method 
  void deleteEntrie(int index){
    entries.removeAt(index);
    notifyListeners();
  }

  //MÉTODO PARA ACTUALIZAR CONTENIDO
  void UpdateContent(int index, String editedcontent){
    entries[index].content = editedcontent;
  }
  //MÉTODO PARA LIMPIAR EL MOOD PORQUE SINO SE QUEDA GUARDADO
  void ClearMood(){
    _selectedMood = null;
    notifyListeners();
  }


  Map<String, List<Journey>> groupEntriesByDay(List<Journey> entries){
    Map<String, List<Journey>> groupedEntries = {};

    for (var entry in entries){
      //se convierte la fecha para agrupar por día 
      String dayKey = DateFormat('yyyy-MM-dd').format(entry.timestamp);

      //Si no existe se crea en una lista vacía
      groupedEntries.putIfAbsent(dayKey, ()=> []);

      groupedEntries[dayKey]!.add(entry);

    }
    groupedEntries.forEach((key, list){
      list.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    });

    return groupedEntries;
  }

}

class MoodInfo{
  final String label;
  final Color color;

  MoodInfo(this.label, this.color);
}







//Fuera de ViewModelProvider 
//TEXTO A LADO DEL ICONO
final Map<IconData, MoodInfo>  moodinfoMap = {
  Icons.sentiment_very_satisfied: MoodInfo("FELIZ", Colors.yellow),
  Icons.sentiment_dissatisfied: MoodInfo('TRISTE', Colors.grey),
  Icons.sentiment_neutral: MoodInfo('MEH', Colors.blue),
  Icons.help_outline: MoodInfo('?', Colors.black)
};
   String getMoodLabel(IconData mood){
    return moodinfoMap[mood]?.label ?? "DESCONOCIDO";
  }

  Color getMoodTextColor(IconData mood){
    return moodinfoMap[mood]?.color ?? Colors.black;
  }

//COLOR DEL ICONO

final Map<IconData, Color> moodColor ={
  Icons.sentiment_very_satisfied: Colors.yellow,
  Icons.sentiment_dissatisfied: Colors.grey,
  Icons.sentiment_neutral: Colors.blue,
  Icons.help_outline: Colors.black
};

Color getMoodColor(IconData mood){
  return moodColor[mood] ?? Colors.black;
}