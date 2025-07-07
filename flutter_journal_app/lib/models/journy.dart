

import 'package:flutter/widgets.dart';

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

}