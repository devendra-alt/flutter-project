import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/services/UIAuth.dart';
import 'package:twinkle_button/twinkle_button.dart';
import 'log_in.dart';
import 'package:sign_button/sign_button.dart';
import 'package:sign_up_app/services/input_validations.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _uname = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showPassword = true;
  Icon icon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      body: Container(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            //for some space
            Expanded(
              child: Container(),
            ),

            //create account details
            Expanded(
              flex: 7,
              child: SingleChildScrollView(
                child: Container(
                  // height: height-110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
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
                              color: Colors.brown,
                            ),
                          ),
                        ),

                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   String status = value.validateUserName();
                            //   if (status == null)
                            //     return null;
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //       content: Text(
                            //         "UserName is Required",
                            //       ),
                            //       backgroundColor: Colors.brown,
                            //       // duration: Duration(seconds: 3),
                            //     ),
                            //   );
                              // return null;
                            // },
                            controller: _uname,
                            cursorColor: Colors.brown[400],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.brown,
                              fontFamily: "Baloo2",
                            ),
                            keyboardType: TextInputType.name,
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.account_box,
                                color: Colors.brown[400],
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              hintText: "UserName",
                              hintStyle: TextStyle(fontFamily: "Baloo2"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.brown,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: TextFormField(
                            // validator: (value) {
                            //   if (value.isValidEmailid())
                            //     return null;
                            //   else
                            //     return "please check your email";
                            // },
                            controller: _email,
                            cursorColor: Colors.brown[400],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.brown,
                              fontFamily: "Baloo2",
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.brown[400],
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                fontFamily: "Baloo2",
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                        //textfield same from log_in.dart
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              print(value);
                              if (value.validateStructure()) {
                                return null;
                              }
                              else if(value==""){
                                return null;
                              }
                              else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Password must contain Capital letters ,Small letters ,Special Charcters , Numbers",
                                  ),
                                  backgroundColor: Colors.brown,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              return null;
                            }},
                            controller: _password,
                            cursorColor: Colors.brown[400],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.brown,
                              fontFamily: "Baloo2",
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _showPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.brown[400],
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  icon.icon,
                                  color: Colors.brown[400],
                                ),
                                onPressed: () {
                                  if (this._showPassword == true) {
                                    setState(
                                      () {
                                        this._showPassword = false;
                                        this.icon = Icon(Icons.visibility_off);
                                      },
                                    );
                                  } else {
                                    setState(
                                      () {
                                        this._showPassword = true;
                                        this.icon = Icon(Icons.visibility);
                                      },
                                    );
                                  }

                                  // this._showPassword = !this._showPassword);
                                },
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2.0,
                                ),
                              ),
                              contentPadding: EdgeInsets.all(15),
                              hintText: "Password",
                              hintStyle: TextStyle(fontFamily: "Baloo2"),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.brown,
                                  width: 2.0,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //or text
                        Container(
                          child: Text(
                            "- - - - - - - - - - or - - - - - - - - - - - -",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.brown,
                              fontFamily: "Baloo2",
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: SignInButton(
                                buttonType: ButtonType.google,
                                onPressed: () async {
                                  getGoogleSignUI(context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                       content: Text("Proccessing ..."),
                                    duration: Duration(milliseconds: 1500),
                                    backgroundColor: Colors.brown,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SignInButton(
                                // padding: 10,
                                // imagePosition:ImagePosition.right,
                              buttonType: ButtonType.facebook,
                              onPressed: () {
                            // print(height);

                                print('click');
                              },
                             ) ,
                          ],
                        ),

                        //for some space
                        SizedBox(
                          height: 35,
                        ),

                        //create account button
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25),
                                child: TwinkleButton(
                                  buttonWidth: 300,
                                  buttonTitle: Text(
                                    "Create Account",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Baloo2",
                                    ),
                                  ),
                                  buttonColor: Colors.brown[500],
                                  onclickButtonFunction: () async {
                                    if (_formKey.currentState.validate()) {
                                      getSignUpUI(
                                        context,
                                        _uname.text.trim(),
                                        _email.text.trim(),
                                        _password.text.trim(),
                                      );
                                      // _uname.clear();
                                      // _email.clear();
                                      // _password.clear();
                                      // ScaffoldMessenger.of(context)
                                      //     .showSnackBar(
                                      //   SnackBar(
                                      //     content: Text("proccessing"),
                                      //   ),
                                      // );
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),

                        //back to login button
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: TwinkleButton(
                                  // twinkleTime: 1,
                                  highlightColor: Colors.brown[100],
                                  buttonWidth: 300,
                                  buttonTitle: Text(
                                    "Back to Log In",
                                    style: TextStyle(
                                      color: Colors.brown,
                                      fontSize: 20.0,
                                      fontFamily: "Baloo2",
                                    ),
                                  ),
                                  buttonColor: Colors.white,
                                  onclickButtonFunction: () {
                                    Navigator.pushReplacement(
                                      context,
                                      PageTransition(
                                        type: PageTransitionType.bottomToTop,
                                        duration: Duration(milliseconds: 800),
                                        reverseDuration:
                                            Duration(milliseconds: 800),
                                        child: Login(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}