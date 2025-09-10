import 'package:flutter/material.dart';

class MoodInfo {
  final String label;
  final Color color;

  MoodInfo(this.label, this.color);
}

final Map<IconData, MoodInfo> moodinfoMap = {
  Icons.sentiment_very_satisfied: MoodInfo("FELIZ", Colors.yellow),
  Icons.sentiment_dissatisfied: MoodInfo("TRISTE", Colors.grey),
  Icons.sentiment_neutral: MoodInfo("MEH", Colors.blue),
  Icons.help_outline: MoodInfo("?", Colors.black),
};

String getMoodLabel(IconData mood) {
  return moodinfoMap[mood]?.label ?? "DESCONOCIDO";
}

Color getMoodTextColor(IconData mood) {
  return moodinfoMap[mood]?.color ?? Colors.black;
}

IconData getMoodIconFromLabel(String label) {
  return moodinfoMap.entries
      .firstWhere(
        (entry) => entry.value.label == label,
        orElse: () => MapEntry(Icons.help_outline, MoodInfo('?', Colors.black)),
      )
      .key;
}

final Map<IconData, Color> moodColor ={
  Icons.sentiment_very_satisfied: Colors.yellow,
  Icons.sentiment_dissatisfied: Colors.grey,
  Icons.sentiment_neutral: Colors.blue,
  Icons.help_outline: Colors.black
};

Color getMoodColor(IconData mood){
  return moodColor[mood] ?? Colors.black;
}