import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  bool _isValidUserName = false;
  bool _isValidPassword = false;
  bool _isValidEmail = false;
  Icon icon = Icon(Icons.visibility);
  bool _showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Container(
          child: Column(
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
                              validator: (value) {
                                String status = value.validateUserName();
                                if (status != null) {
                                  final snackBar = SnackBar(
                                    content: Text(status),
                                    backgroundColor: Colors.brown,
                                  );
                                  ScaffoldMessenger.maybeOf(context)
                                      .showSnackBar(snackBar);
                                  _isValidUserName = false;
                                  print(status);
                                  return null;
                                } else {
                                  _isValidUserName = true;
                                  return null;
                                }
                              },
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
                              validator: (value) {
                                if (!value.isValidEmailid()) {
                                  final snackBar = SnackBar(
                                    content: Text("invalid emailid"),
                                    backgroundColor: Colors.brown,
                                  );
                                  ScaffoldMessenger.maybeOf(context)
                                      .showSnackBar(snackBar);
                                  _isValidEmail = false;
                                  return null;
                                } else {
                                  _isValidEmail = true;
                                  return null;
                                }
                              },
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
                                  borderSide: BorderSide(
                                      color: Colors.brown, width: 2.0),
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
                                  _isValidPassword = false;
                                  return null;
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "password must contain capital letters ,small letters ,special charcters or numbers",
                                      ),
                                      backgroundColor: Colors.brown,
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                  _isValidPassword = false;
                                  return null;
                                }
                              },
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
                                          this.icon =
                                              Icon(Icons.visibility_off);
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
                                    setState(() {
                                      _showSpinner = true;
                                    });
                                    await getGoogleSignUI(context);
                                    setState(() {
                                      _showSpinner = false;
                                    });
                                  },
                                ),
                              ),
                              SignInButton(
                                // padding: 10,
                                // imagePosition:ImagePosition.right,
                                buttonType: ButtonType.facebook,
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("comming soon ..."),
                                      duration: Duration(milliseconds: 1500),
                                      backgroundColor: Colors.brown,
                                    ),
                                  );
                                },
                              ),
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
                                      setState(() {
                                        _showSpinner = true;
                                      });
                                      if (_formKey.currentState.validate() &&
                                          _isValidUserName &&
                                          _isValidPassword &&
                                          _isValidEmail) {
                                        await getSignUpUI(
                                          context,
                                          _uname.text.trim(),
                                          _email.text.trim(),
                                          _password.text.trim(),
                                        );
                                      }
                                      setState(() {
                                        _showSpinner = false;
                                      });
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
      ),
    );
  }
}
