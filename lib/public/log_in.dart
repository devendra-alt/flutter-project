import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/public/create_account.dart';
import 'package:sign_up_app/public/landing.dart';
import 'package:sign_up_app/services/UIAuth.dart';
import 'package:twinkle_button/twinkle_button.dart';
import 'package:sign_button/sign_button.dart';
import 'package:sign_up_app/services/input_validations.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _showPassword = true;

  Icon icon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[50],
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              // 1.logo
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/bg.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: logo1(),
                ),
              ),

              //2.Login details
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        //for some space
                        SizedBox(
                          height: 20,
                        ),

                        //Login to Continue Text
                        Container(
                          margin: EdgeInsets.only(bottom: 15),
                          child: Text(
                            "Login to Continue",
                            style: TextStyle(
                                fontFamily: "Baloo2",
                                fontSize: 28.0,
                                color: Colors.brown),
                          ),
                        ),

                        //textField Function
                        Container(
                          margin: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 15,
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isValidEmail())
                                return null;
                              else
                                return "please check your email";
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
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 15),
                          child: TextFormField(
                            validator: (value) {
                              if (value.isValidPassword())
                                return null;
                              else
                                return "password is required";
                            },
                            controller: _password,
                            cursorColor: Colors.brown[400],
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.brown,
                                fontFamily: "Baloo2"),
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: _showPassword,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.vpn_key,
                                color: Colors.brown[400],
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(icon.icon, color: Colors.brown[400]),
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
                                borderSide:
                                    BorderSide(color: Colors.brown, width: 2.0),
                              ),
                            ),
                          ),
                        ),
                        //textfield fuction

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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SignInButton.mini(
                              buttonType: ButtonType.google,
                              onPressed: () async {
                                getGoogleSignUI(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("proccessing"),
                                  ),
                                );
                              },
                            ),
                            SignInButton.mini(
                              buttonType: ButtonType.facebook,
                              onPressed: () {
                                print('click');
                              },
                            ),
                          ],
                        ),

                        //for some space
                        SizedBox(
                          height: 25,
                        ),

                        //Login Button
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(bottom: 25),
                                child: TwinkleButton(
                                  onclickButtonFunction: () async {
                                    if (_formKey.currentState.validate()) {
                                      getSignInUI(
                                        context,
                                        _email.text.trim(),
                                        _password.text.trim(),
                                      );
                                      _email.clear();
                                      _password.clear();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text("proccessing"),
                                        ),
                                      );
                                    }
                                  },
                                  buttonWidth: 300,
                                  buttonTitle: Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: "Baloo2",
                                    ),
                                  ),
                                  buttonColor: Colors.brown[500],
                                ),
                              ),
                            )
                          ],
                        ),

                        //Create Account Button
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
                                    "Create Account",
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
                                        child: CreateAccount(),
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
            ],
          ),
        ),
      ),
    );
  }
}
