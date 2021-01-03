import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:sign_up_app/public/landing.dart';
import 'package:sign_up_app/services/auth.dart';

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
              onPressed: () async {
                bool isGood =
                    await context.read<AuthenticationService>().signOut();
                if (isGood) {
                  Navigator.pushReplacement(
                      context,
                      PageTransition(
                          type: PageTransitionType.bottomToTop,
                          duration: Duration(milliseconds: 800),
                          reverseDuration: Duration(milliseconds: 800),
                          child: Landing()));
                } else {
                  Scaffold.of(context).showSnackBar((SnackBar(
                    content: Text("error happening"),
                  )));
                }
              },
              icon: Icon(Icons.unsubscribe_rounded),
              label: Text("signout"))
        ],
      ),
    );
  }
}
