import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:provider/provider.dart';

class ViewModelProvider extends ChangeNotifier{

  //Entries List
  final List<Journey> _entries = [

    Journey(id: '12344', content: 'Pueba', mood: Icons.sentiment_very_satisfied, timestamp: DateTime.now()),
    Journey(id: '12344', content: 'Prueba 2', mood: Icons.sentiment_very_satisfied, 
    timestamp: DateTime.now().subtract(Duration(days: 1)) )




  ];

  List<Journey> get entries => _entries;



final Map<IconData, String >  moodLabeles = {
  Icons.sentiment_very_satisfied: "FELIZ",
  Icons.sentiment_dissatisfied: "TRISTE",
  Icons.sentiment_neutral: "MEH",
  Icons.help_outline: "?"
};


late IconData _selectedMood;
IconData get selectedMood => _selectedMood;

  void setMood(IconData mood){

    _selectedMood = mood;

    notifyListeners();

  }

  String getMoodLabel(IconData mood){
    return moodLabeles[mood] ?? "DESCONOCIDO";
  }

  //Add entries method
  void addEntrie(String newid, String newcontent, IconData newmood,  final newtimestamp){

    final newEntrie = Journey(
     id: newid,
     content: newcontent,
     mood: _selectedMood,
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

}