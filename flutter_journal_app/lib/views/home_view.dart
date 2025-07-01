import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/widgets/entry.dart';
import 'package:provider/provider.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final JournalVM = Provider.of<ViewModelProvider>(context);
    final entries = JournalVM.entries.reversed.toList();
    return Scaffold(

      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index){
          final journey = entries[index];
        
        return EntryCard(list: journey);
      })
      
    );
  }
}