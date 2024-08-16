import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:to_do_list/screens/spashpage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Supabase.initialize(
    url: 'https://sqsliyqbxaayrnbkzgqw.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InNxc2xpeXFieGFheXJuYmt6Z3F3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjA2MTEwMzcsImV4cCI6MjAzNjE4NzAzN30.0lp73G3pLEFtQwVlQM1OOgyQghektcdiSn33FdSdPts',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TO DO LIST',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashPage(),
    );
  }
}

