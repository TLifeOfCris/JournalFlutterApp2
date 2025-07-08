import 'package:flutter/material.dart';
import 'package:flutter_journal_app/models/journy.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/views/add_entry_view.dart';
import 'package:flutter_journal_app/widgets/entry.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
          
          return Slidable(
            key: ValueKey(journey.id),
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
            
            
            child:  EntryCard(list: journey));
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