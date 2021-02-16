import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:twinkle_button/twinkle_button.dart';
import 'package:sign_up_app/public/log_in.dart';
import 'package:page_transition/page_transition.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // 1 logo
            logo1(),

            //2 image
            DelayedDisplay(
              delay: Duration(seconds: 2),
              slidingCurve: Curves.fastLinearToSlowEaseIn,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 62.0,
                  top: 0,
                ),
                height: 300,
                width: 350,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "images/coffee_time2.png",
                    ),
                  ),
                ),
              ),
            ),

            //3 Get Staretd button
            DelayedDisplay(
              delay: Duration(milliseconds: 2500),
              slidingCurve: Curves.elasticIn,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        bottom: 25,
                      ),
                      child: TwinkleButton(
                        buttonWidth: 300,
                        durationTime: 3,
                        buttonTitle: Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontFamily: "Baloo2",
                          ),
                        ),
                        buttonColor: Colors.brown,
                        onclickButtonFunction: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              duration: Duration(milliseconds: 800),
                              reverseDuration: Duration(milliseconds: 700),
                              child: Login(),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget logo1() {
  return DelayedDisplay(
    delay: Duration(seconds: 1),
    slidingCurve: Curves.easeInCirc,
    child: Container(
      margin: EdgeInsets.only(left: 50, top: 0),
      height: 275,
      width: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.center,
          image: AssetImage(
            "images/logo.png",
          ),
        ),
      ),
    ),
  );
}
