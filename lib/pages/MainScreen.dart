import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trafic/pages/MyHomePage.dart';

import 'login_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellowAccent,
        title: const Text('E_ Accident Report'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return LoginScreen();
            }));
          },
          style: const ButtonStyle(),
          child: const Text(
            "تسجيل حادث جديد",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
