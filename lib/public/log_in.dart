import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/public/create_account.dart';
import 'package:sign_up_app/public/landing.dart';
import 'package:sign_up_app/services/UIAuth.dart';
import 'package:twinkle_button/twinkle_button.dart';
import 'package:sign_button/sign_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

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
  bool _showSpinner = false;

  Icon icon = Icon(Icons.visibility);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.brown[100],
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // 1.logo
                Expanded(
                  child: Container(
                    child: logo1(),
                  ),
                ),

                //2.Login details
                Expanded(
                  flex: 2,
                  child: SingleChildScrollView(
                    child: Container(
                      // height: height-275,
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
                                color: Colors.brown,
                              ),
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
                            margin: EdgeInsets.only(
                                left: 20, right: 20, bottom: 15),
                            child: TextFormField(
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
                                  icon:
                                      Icon(icon.icon, color: Colors.brown[400]),
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
                          //textfield fuction

                          // Google and Facebook button
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
                                  setState(() {
                                    _showSpinner = true;
                                  });
                                  await getGoogleSignUI(context);
                                  setState(() {
                                    _showSpinner = false;
                                  });
                                },
                              ),
                              SignInButton.mini(
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
                            height: 25,
                          ),

                          //Login Button
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(bottom: 25),
                                  // ignore: missing_required_param
                                  child: TwinkleButton(
                                    // buttonWidth: width-100,

                                    onclickButtonFunction: () async {
                                      setState(() {
                                        _showSpinner = true;
                                      });
                                      if (_formKey.currentState.validate()) {
                                        await getSignInUI(
                                          context,
                                          _email.text.trim(),
                                          _password.text.trim(),
                                        );
                                      }
                                      setState(() {
                                        _showSpinner = false;
                                      });
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
      ),
    );
  }
}
