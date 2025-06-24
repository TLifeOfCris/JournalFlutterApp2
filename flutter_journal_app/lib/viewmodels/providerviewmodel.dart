import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:provider/provider.dart';

class ViewModelProvider extends ChangeNotifier{

  //Entries List
  List<Journey> entries = [



  ];


  //Add entries method
  void addEntrie(String newid, String newcontent, String newmood,  final newtimestamp){

    final newEntrie = Journey(
     id: newid,
     content: newcontent,
     mood: newmood,
     timestamp: newtimestamp);

     entries.add(newEntrie);
     notifyListeners();
  }

  //Delete entrie from list method 
  void deleteEntrie(int index){
    entries.removeAt(index);
    notifyListeners();
  }

}