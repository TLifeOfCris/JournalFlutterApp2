import 'package:flutter/material.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/views/home_view.dart';
import 'package:flutter_journal_app/views/add_entry_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ViewModelProvider() ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        ),
        home: 
        //HomeView(),
        AddEntryView(),
        
      ),
    );
  }
}


