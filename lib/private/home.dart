import 'package:flutter/material.dart';
import 'Homep.dart';                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
import 'Order.dart';
import 'Settings.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBottomNavigationBar(),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int Myindex = 0;
  final List<Widget> children = [ Orderp(), Settingp()];
  void onTapped(int index) {
    setState(() {
      Myindex = index;
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: children[Myindex],
      bottomNavigationBar:
          BottomNavigationBar(onTap: onTapped, currentIndex: Myindex, 
          selectedItemColor: Colors.brown,
          unselectedFontSize: 11,
          selectedLabelStyle: TextStyle(fontFamily: "Baloo2"),
          unselectedLabelStyle: TextStyle(fontFamily: "Baloo2"),
          iconSize: 22,
          items: 
    
          [
          
        // BottomNavigationBarItem(
        //   icon: new Icon(Icons.star),
        //   label: "Home",
        // ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          label: "Home",
          // backgroundColor: Colors.brown,
          
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.settings),
          label: "Settings",
        ),
      ]),
    );
  }
}
