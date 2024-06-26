import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trafic/firebase_options.dart';
import 'package:trafic/pages/MainScreen.dart';
import 'package:trafic/pages/login_screen.dart';
import 'package:flutter/material.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();

// ...

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E_ Accident Report',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}
