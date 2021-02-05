import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sign_up_app/public/landing.dart';
import 'package:sign_up_app/services/auth.dart';
import 'package:provider/provider.dart';
// import 'package:sign_up_app/services/modules/User.dart';
// import 'package:sign_up_app/public/create_account.dart';
// import 'package:sign_up_app/services/auth.dart';
   
class Settingp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   final FirebaseAuth auth = FirebaseAuth.instance;

    final User user = auth.currentUser;
    // final uName = user.displayName;
    final uemail = user.email;
           
  

  
    return Scaffold(
      // backgroundColor: Colors.lightBlue,
      body: Container(
       
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,

          // crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(uemail),
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
    
      
        ],)
    ));
  }

}

/*class Listview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              color: Colors.brown[300],
              height: 100.0,
              child: Row(
                children: [
                  Text("CCD",
                      style: TextStyle(fontSize: 40.2, color: Colors.black)),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}*/
