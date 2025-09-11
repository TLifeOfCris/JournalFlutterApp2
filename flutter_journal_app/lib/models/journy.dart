

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    final moodRaw = data['mood'];
    IconData moodIcon;
    if (moodRaw is int){
      //si es int (codePoint), reconstruimos el icono directamente
      moodIcon = IconData(moodRaw, fontFamily: 'MaterialIcons');
    } else if (moodRaw is String){
      moodIcon = getMoodIconFromLabel(moodRaw);
    } else {
      moodIcon = Icons.help_outline;
    }
   /* return Journey(id: data['id'] ?? '',
     content: data['content'] ?? '',
      mood: getMoodIconFromLabel(data['mood'] ?? '?'),
       timestamp: (data['timestamp'] as Timestamp).toDate(),);
  */
    return Journey(id: doc.id, content: data['content'], mood: moodIcon, timestamp: (data['timestamp'] as Timestamp).toDate());
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