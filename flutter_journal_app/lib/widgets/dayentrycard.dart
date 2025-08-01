import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:intl/intl.dart';

class Dayentrycard extends StatelessWidget {
  final DateTime day;
  final List<Journey> entries;
  const Dayentrycard({super.key,
   required this.day,
    required this.entries});


  String getFormattedDate(DateTime timestamp){
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final entryDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    final formattedDate = DateFormat('MMM d').format(timestamp).toUpperCase();
    

    if (entryDate == today){
      return 'TODAY $formattedDate';
    } else if (entryDate == today.subtract(Duration(days: 1))){
      return "YESTERDAY $formattedDate";
    } else {
      final weekday = DateFormat('EEEE').format(timestamp).toUpperCase();
      return "$weekday $formattedDate";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        elevation: 3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //HEADER CON FECHA
            Container(
              width: double.infinity,
              color: Color.fromARGB(200, 119, 221, 119),
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today),
                  const SizedBox(width: 8.0,),
                  Text(
                    getFormattedDate(day),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            //entradas de ese dia
            ...entries.map((entry){
              return Padding(padding: EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Icon(entry.mood, color: getMoodColor(entry.mood)),
                  const SizedBox(width: 8,),
                  Text(getMoodLabel(entry.mood),
                  style: TextStyle(color: getMoodColor(entry.mood)),
                  
                  ),
                  const SizedBox(width: 8,),
                  Expanded(child: Text(entry.content)),
                  Text(DateFormat('jm').format(entry.timestamp))
                ],
              ),);
            }).toList(),
          ],
        ),
      ),
    );
  }
}