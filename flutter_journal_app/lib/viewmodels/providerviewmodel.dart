import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_journal_app/utils/mood_utils.dart';

class ViewModelProvider extends ChangeNotifier{
  //Entries List
  final List<Journey> _entries = [

    //Journey(id: '12344', content: 'Pueba', mood: Icons.sentiment_very_satisfied, timestamp: DateTime.now()),
    //Journey(id: '12344', content: 'Prueba 2', mood: Icons.sentiment_very_satisfied, 
    //timestamp: DateTime.now().subtract(Duration(days: 1)) )




  ];

  List<Journey> get entries => _entries;





IconData? _selectedMood;
IconData? get selectedMood => _selectedMood;

  void setMood(IconData mood){

    _selectedMood = mood;

    notifyListeners();

  }

 

  //Borrar entries en la tarjeta

  void deleteSpeciftEntry(Journey entry) async {
    try{
      await FirebaseFirestore.instance.collection('entries').doc(entry.id).delete();
      _entries.remove(entry);
      notifyListeners();
    } catch (e){
      print('Error al eliminar entry: $e');
    }
  }
  //Cargar entradas en FireStore
  Future <void> loadEntries() async{

    //buscar usuario autentificado en firebase
    final user = FirebaseAuth.instance.currentUser;

    //si no está autentificado termina la función
    if (user == null) return;

    //busca en firestore la colección de notas del usuario actualizadas.

    try {
      final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('entries')
      .orderBy('timestamp', descending: true)
      .get();

      _entries.clear(); //limpia la lista actual

      _entries.addAll(snapshot.docs.map((doc) => Journey.fromFirestore(doc)).toList());
      notifyListeners();

    } catch (e) {
      print('Error al cargar entradas: $e');
    }



  }



  //Add entries method
  /*
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
  */

  //Add entries method

  Future<void> addEntrie(String newContent, IconData newMood) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final timestamp = DateTime.now();

   /*
    try {
      DocumentReference docRef = await FirebaseFirestore.instance.collection('entries').add({
        'content': newContent,
        'mood': newMood,
        'timestamp': timestamp,
        'userId': user.uid
      });

      final newEntry = Journey(id: docRef.id, content: newContent, mood: newMood, timestamp: timestamp);
      _entries.add(newEntry);
      notifyListeners();
    */

    try{
      final entryRef = FirebaseFirestore.instance.collection('users')
      .doc(user.uid)
      .collection('entries')
      .doc();

      await entryRef.set({
        'content': newContent,
        'mood': getMoodLabel(newMood),
        'timestamp': timestamp,
        'userId': user.uid
      });
      final newEntry = Journey(
      id: entryRef.id,
       content: newContent,
       mood: IconData(newMood.codePoint, fontFamily: 'MaterialIcons'),
      timestamp: timestamp);
      _entries.add(newEntry);
      notifyListeners();
    } catch (e){
      print('Error al guardar en Firestore: $e');
    }
  }


  //INICIALIZAR ENTRIES AL ABRIR APP


  Future<void> fetchEntries() async{
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return ;
    try {
      //Cambiar esta parte 
      /*
      final snapshot = await FirebaseFirestore.instance.collection('entries')
      .where('userId', isEqualTo: user.uid).orderBy('timestamp', descending:  true).get();
      */

      final snapshot = await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('entries').
      orderBy('timestamp', descending: true).get();

      _entries.clear();

      for (var doc in snapshot.docs){
        final data = doc.data();
        _entries.add(Journey(id: doc.id, content: data['content'], mood: IconData(data['mood'], fontFamily: 'MaterialIcons'),
         timestamp: (data['timestamp'] as Timestamp).toDate(),));
      }
      notifyListeners();

    } catch (e) {
      print('error al cargar entradas: $e');
    }
  }






  //Delete entrie from list method 

  
  void deleteEntrie(int index){
    entries.removeAt(index);
    notifyListeners();
  }
  
  

  //MÉTODO PARA ACTUALIZAR CONTENIDO
  //agregar new mood cuando sepas como hacerlo
  void UpdateContent(String entryId, String newContent, IconData newMood){
    final index = _entries.indexWhere((entry) => entry.id == entryId);
    if (index != -1){
      _entries[index].content = newContent;
      _entries[index] = Journey(id: _entries[index].id,
       content: newContent,
        //mood: _entries[index].mood,
        mood: newMood,
        timestamp: _entries[index].timestamp);
      notifyListeners();
    }
    
  }
  //MÉTODO PARA LIMPIAR EL MOOD PORQUE SINO SE QUEDA GUARDADO
  void ClearMood(){
    _selectedMood = null;
    notifyListeners();
  }

  //entradas por día


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

    //FIREBASE PROVIDER DE AQUI 



}

class MoodInfo{
  final String label;
  final Color color;

  MoodInfo(this.label, this.color);
}







//Fuera de ViewModelProvider 
//TEXTO A LADO DEL ICONO

/*
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
*/
