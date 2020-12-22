import 'package:flutter/material.dart';
import 'package:sign_up_app/public/landing.dart';

void main() {
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

