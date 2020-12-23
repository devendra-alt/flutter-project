import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_app/public/landing.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Landing(),
    );
  }
}
