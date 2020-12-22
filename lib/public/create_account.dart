import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/private/home.dart';

// import 'package:sign_up_app/public/landing.dart';
import 'package:twinkle_button/twinkle_button.dart';

import 'log_in.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.brown[100],
        body: Container(
            child: Column(children: <Widget>[

              //for some space 
          Expanded(
              child: Container(
              
          )),

          //create account details
          Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      //for some space
                      SizedBox(
                        height: 20,
                      ),

                      //Create account text
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                              fontFamily: "Baloo2",
                              fontSize: 25.0,
                              color: Colors.brown),
                        ),
                      ),

                      //textfield same from log_in.dart
                      textfield("Name", Icon(Icons.person_add),
                          TextInputType.name, false),


                      //textfield same from log_in.dart
                      textfield("Email", Icon(Icons.email),
                          TextInputType.emailAddress, false),
                      
                      //textfield same from log_in.dart
                      textfield("Password", Icon(Icons.vpn_key),
                          TextInputType.visiblePassword, true),

                      //textfield same from log_in.dart
                      textfield("Confirm Password", Icon(Icons.vpn_key),
                          TextInputType.visiblePassword, true),

                          //for some space
                      SizedBox(
                        height: 81,
                      ),

                      //create account button
                      Row(children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 25),
                          child: TwinkleButton(
                              buttonWidth: 300,
                              durationTime: null,
                              buttonTitle: Text(
                                "Create Account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontFamily: "Baloo2"),
                              ),
                              buttonColor: Colors.brown[500],
                              onclickButtonFunction: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.topToBottom,
                                        duration: Duration(milliseconds: 800),
                                        reverseDuration:
                                            Duration(milliseconds: 800),
                                        child: Home()));
                              }),
                        ))
                      ]),

                      //back to login button
                      Row(children: <Widget>[
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: TwinkleButton(
                              // twinkleTime: 1,
                              highlightColor: Colors.brown[100],
                              buttonWidth: 300,
                              durationTime: null,
                              buttonTitle: Text(
                                "Back to Log In",
                                style: TextStyle(
                                    color: Colors.brown,
                                    fontSize: 20.0,
                                    fontFamily: "Baloo2"),
                              ),
                              buttonColor: Colors.white,
                              onclickButtonFunction: () {
                                Navigator.pop(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 800),
                                        reverseDuration:
                                            Duration(milliseconds: 800),
                                        child: Login()));
                              }),
                        ))
                      ])
                    ],
                  ),
                ),
              )),
        ])));
  }
}
