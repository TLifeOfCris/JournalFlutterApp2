

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_journal_app/utils/mood_utils.dart';

class Journey {
  //ID de la nota
  final String id;
  //Contenido de la nota
   String content;
  //Mood: Excelente, Feliz, MEH, aburrido, malo
  final IconData mood;
  //Tiempo en que se creó la nota
  final DateTime timestamp; 

  Journey({ 
  required this.id, 
  required this.content, 
  required this.mood, 
  required this.timestamp});


  factory Journey.fromFirestore(DocumentSnapshot doc){
    final data = doc.data() as Map<String, dynamic>;
    return Journey(id: data['id'] ?? '',
     content: data['content'] ?? '',
      mood: getMoodIconFromLabel(data['mood'] ?? '?'),
       timestamp: (data['timestamp'] as Timestamp).toDate(),);
  }

  //método para guardar en firestore

  Map<String, dynamic> toFirestre(String userId){
    return{
      'content':content,
      'mood': getMoodLabel(mood),
      'timestamp': timestamp,
      'userId': userId,
    };
  }


  

}