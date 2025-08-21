import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_journal_app/firebase_options.dart';
import 'package:flutter_journal_app/viewmodels/providerviewmodel.dart';
import 'package:flutter_journal_app/views/home_view.dart';
import 'package:flutter_journal_app/views/add_entry_view.dart';
import 'package:provider/provider.dart';

void main() async {
  //Asegura que todo este listo antes de iniciar firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        //DEFINIR RUTAS
        initialRoute: '/',
        routes: {
          
          '/add': (context) => AddEntryView()
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: CircleBorder()
          )

        ),
        home: 
        HomeView(),
        //AddEntryView(),
        
      ),
    );
  }
}


