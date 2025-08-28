import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/views/add_entry_view.dart';
import 'package:flutter_journal_app/widgets/dayentrycard.dart';
import 'package:flutter_journal_app/widgets/entry.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    final JournalVM = Provider.of<ViewModelProvider>(context);
    final entries = JournalVM.entries.reversed.toList();
    final grouped = JournalVM.groupEntriesByDay(entries);

    final sortedKeys = grouped.keys.toList()
    ..sort((a, b) => DateTime.parse(b).compareTo(DateTime.parse(a)));
    
    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, '/profileScreen');
          }, icon: Icon(Icons.person))
        ],
      ),

      body: ListView.builder(
          itemCount: sortedKeys.length,
          itemBuilder: (context, index){
            final key = sortedKeys[index];
            final entries = grouped[key]!;
            final day = DateTime.parse(key);
          
          return Slidable(
            key: ValueKey(sortedKeys),
            //revisar 
            endActionPane: ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(onPressed: (_){
                JournalVM.deleteEntrie(entries.length - 1 - index);
                
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'borrar'
              )
            ]),
            
            //aquí

            child:  Dayentrycard(day: day, entries: entries));
        }),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        
        floatingActionButton: FloatingActionButton(


          backgroundColor: Colors.amber,
          
          
          
          
          
          onPressed: 
        
        (){
          Navigator.pushNamed(context, '/add');
        },

        

        child: Icon(Icons.add),
        
        ),
      )
      
    ;
  }
}