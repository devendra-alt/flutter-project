import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        actions: [
          FlatButton.icon(
              onPressed: (){
              
              },

              icon: Icon(Icons.unsubscribe_rounded),
              label: Text("signout"))
        ],
      ),
    );
  }
}
