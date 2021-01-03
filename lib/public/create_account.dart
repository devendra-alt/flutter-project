import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/private/home.dart';
import 'package:sign_up_app/services/auth.dart';
import 'package:twinkle_button/twinkle_button.dart';
import 'package:provider/provider.dart';
import 'log_in.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _uNameController = TextEditingController();
  final TextEditingController _uEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _configPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.brown[100],
        body: Container(
            child: Column(children: <Widget>[
          //for some space
          Expanded(child: Container()),

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
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                controller: _uNameController,
                                style: TextStyle(fontSize: 18),
                                keyboardType: TextInputType.name,
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "UserName",
                                    hintStyle: TextStyle(fontFamily: "Baloo2")),
                              ))
                            ],
                          )),

                      //textfield same from log_in.dart
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.email,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                controller: _uEmailController,
                                style: TextStyle(fontSize: 18),
                                keyboardType: TextInputType.emailAddress,
                                obscureText: false,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "Email",
                                    hintStyle: TextStyle(fontFamily: "Baloo2")),
                              ))
                            ],
                          )),

                      //textfield same from log_in.dart
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.vpn_key,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                controller: _passwordController,
                                style: TextStyle(fontSize: 18),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "Password",
                                    hintStyle: TextStyle(fontFamily: "Baloo2")),
                              ))
                            ],
                          )),

                      //textfield same from log_in.dart
                      Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                child: Icon(
                                  Icons.vpn_key,
                                  size: 20,
                                  color: Colors.grey,
                                ),
                              ),
                              Expanded(
                                  child: TextField(
                                controller: _configPasswordController,
                                style: TextStyle(fontSize: 18),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(15),
                                    hintText: "Confirm Password",
                                    hintStyle: TextStyle(fontFamily: "Baloo2")),
                              ))
                            ],
                          )),

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
                              onclickButtonFunction: () async {
                                String msg = await context
                                    .read<AuthenticationService>()
                                    .signUp(
                                        email: _uEmailController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                        uName: _uNameController.text.trim());

                                if (msg == "Signed up") {
                                  print("e");
                                  Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.bottomToTop,
                                          duration:
                                              Duration(milliseconds: 1000),
                                          reverseDuration:
                                              Duration(milliseconds: 800),
                                          child: Home()));
                                }
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
